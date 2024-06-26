# Generate mock datasets

## Markov dymamics

check_pair <- function(x, y) {
    stopifnot(x >= 0)
    stopifnot(x <= 1)
    stopifnot(y >= 0)
    stopifnot(y <= 1)
    stopifnot(x + y <= 1)
}
gen_mc <- function(p_BP, p_BT, p_PB, p_PT, p_TP, p_TB) {
    check_pair(p_BP, p_BT)
    check_pair(p_PB, p_PT)
    check_pair(p_TP, p_TB)
    cbind(
        c(1 - p_BP - p_BT, p_BP, p_BT),
        c(p_PB, 1 - p_PB - p_PT, p_PT),
        c(p_TB, p_TP, 1 - p_TB - p_TP)
    )
}

run_mc <- function(start, M, n = 1) {
    out <- start |> as.matrix()
    for (i in seq_len(n)) {
        out <- cbind(out, M %*% out[, i])
    }
    out
}

get_eq <- function(M) {
    tmp <- eigen(M)$vectors[, 1] / sum(eigen(M)$vectors[, 1])
    stopifnot(all(Im(tmp) == 0))
    Re(tmp)
}

M <- gen_mc(0.1, 0.2, 0.2, 0.2, 0.05, 0.15)
res <- run_mc(c(1, 0, 0), M, 25)
v_eq <- get_eq(M)

pal <- c("#87cdde", "#8d5fd3", "#ff2a7f")

plot(c(0, 25), c(0, 1), type = "n")
for (i in 1:3) {
    lines(0:25, res[i, ], col = pal[i], lwd = 4)
}
for (i in 1:3) {
    points(25, v_eq[i], col = pal[i], cex = 5, pch = 19)
}



## Link with temperature


logit <- qlogis
inv_logit <- plogis

# function than generates a markov chain that varies with temperature
# Such as when low, then Boreal and high temperate.

s_temp <- seq(-10, 10, 0.1)

par(mfrow = c(1, 2))
plot(c(-10, 10), c(0, 0.1), type = "n", main = "From temperates")
lines(s_temp, 0.1 * inv_logit(s_temp * 0.5 - 2), lty = 1, lwd = 2)
lines(s_temp, 0.1 * (1 - inv_logit(s_temp * 0.5 + 2)), lty = 2, lwd = 2)
legend("right", c("p_BT", "p_TB"), bty = "n", lwd = 2, lty = c(1, 2))
plot(c(-10, 10), c(0, 0.2), type = "n", main = "From pioneers")
lines(s_temp, 0.5 * inv_logit(s_temp * 0.5), lty = 1, lwd = 2)
lines(s_temp, 0.5 * (1 - inv_logit(s_temp * 0.5)), lty = 2, lwd = 2)
legend("right", c("p_PT", "p_PB"), bty = "n", lwd = 2, lty = c(1, 2))



gen_mc_temp <- function(temp) {
    gen_mc(
        0.1, 
        0.1 * inv_logit(temp * 0.5 + 2), 
        0.5 * (1 - inv_logit(temp * 0.5)),
        0.5 * inv_logit(temp * 0.5),
        0.05,
        0.1 * (1 - inv_logit(temp * 0.5 + 2))
    )
}

grad_eq <- function(v_temp) {
    out <- list()
    for (i in seq(v_temp)) {
        out[[i]] <- gen_mc_temp(v_temp[i]) |> get_eq()
    }
    do.call(cbind, out) 
}


s_temp <- seq(-10, 10, 0.1)
res <- grad_eq(s_temp)

plot(range(s_temp), c(0, 1), type = "n")
for (i in 1:3) {
    lines(s_temp, res[i, ], col = pal[i], lwd = 4)
}



# This gives me the equilibrium for a given T and so I can sample properly for any T


sample_states <- function(temp) {
    if (length(temp) > 1) {
        lapply(temp, sample_states)  |> unlist()
    } else {
        eq <- gen_mc_temp(temp) |> get_eq()
        c("B", "P", "T")[which(runif(1) <= cumsum(eq))[1L]]
    }
}

# Create a temperature gradient grid 
mod_temp <- function(time, latitude) {
    (time - 1960) * 0.025 + (55 - latitude) + rnorm(1) * 2
}


gen_data_plot <- function(n) {
    out <- list()
    for (i in seq_len(n)) {
        out[[i]] <- data.frame(
            plot_id = i,
            latitude = rep(runif(1, 45, 65), 3),
            time = 1960.0 + runif(3, 10, 20) |> cumsum()
        )
        out[[i]]$temperature <- mod_temp(out[[i]]$time, out[[i]]$latitude)
        out[[i]]$state <- sample_states(out[[i]]$temperature)
    }
    out |>
        do.call(what = rbind)
}


mock_data <- gen_data_plot(10000)


tmp <- mock_data  |> 
    dplyr::mutate(temp_floor = floor(temperature))  |>
    dplyr::group_by(temp_floor, state)  |>
    dplyr::summarize(count = dplyr::n())
    
tmp  |> 
    ggplot2::ggplot(ggplot2::aes(x = temp_floor, y = count, color = state)) + ggplot2::geom_line()







# Inference with msm 
library(msm)
mock_data$state2 <- as.factor(mock_data$state) |> as.numeric()

statetable.msm(state, plot_id, data = mock_data)

Q <- matrix(1, 3, 3)

res1 <- msm(state2 ~ time,
    subject = plot_id,
    data = mock_data,
    qmatrix = Q,
    gen.inits = TRUE,
    control = list(fnscale = 5000)
)


pmatrix.msm(res1, t = 1)

res2 <- msm(state2 ~ time,
    subject = plot_id,
    data = mock_data,
    qmatrix = Q,
    gen.inits = TRUE,
    covariates = list(
        "2-1" = ~temperature,
        "2-3" = ~temperature,
        "3-1" = ~temperature,
        "1-3" = ~temperature
    ),
    obstype = 1,
    control = list(maxit = 1000, fnscale = 30000, trace = 1, reltol = 1e-16)
)



for (i in seq(s_temp)) {
    res_temp[[i]] <- pmatrix.msm(res2, t = 1, covariates = list(temperature = s_temp[i]))
}

plot(range(s_temp), c(0, 1), type = "n")
lines(s_temp, lapply(res_temp, \(x) x[1, 3]) |> unlist())
lines(s_temp, lapply(res_temp, \(x) x[3, 1]) |> unlist())

plot(range(s_temp), c(0, 1), type = "n")
lines(s_temp, lapply(res_temp, \(x) x[2, 1]) |> unlist())
lines(s_temp, lapply(res_temp, \(x) x[2, 3]) |> unlist(), lty = 2)





## INLA 

## requires to use transition only

library(INLAjoint)
library(INLA)

# needed to encode event properly, one per transition non on itself so 6 total
# then what is infered are the trnasition rates, thus the exponential matrux works

tweak_df <- function(x) {
    if (nrow(x) > 0) {
        out <- x[-1, ]
        out$difftime <- x$time  |> diff()
        out$event_raw <- paste0(x$state[-nrow(x)], x$state[-1L])
        out
    } else {
        NULL
    }
}
tmp <- split(mock_data, f = as.factor(mock_data$plot_id))  |>
    lapply(tweak_df) |>
    do.call(what = rbind)

tmp2 <- tmp |>
    dplyr::mutate(
        eventBP = dplyr::case_when(
            event_raw == "BB" ~ 2,
            event_raw == "BP" ~ 4,
            .default = 0
        ), 
        eventBT = dplyr::case_when(
            event_raw == "BB" ~ 2,
            event_raw == "BT" ~ 4,
            .default = 0
        ),
        eventPB = dplyr::case_when(
            event_raw == "PP" ~ 2,
            event_raw == "PB" ~ 4,
            .default = 0
        ),
        eventPT = dplyr::case_when(
            event_raw == "PP" ~ 2,
            event_raw == "PT" ~ 4,
            .default = 0
        ), 
        eventTB = dplyr::case_when(
            event_raw == "TT" ~ 2,
            event_raw == "TB" ~ 4,
            .default = 0
        ), 
        eventTP = dplyr::case_when(
            event_raw == "TT" ~ 2,
            event_raw == "TP" ~ 4,
            .default = 0
        ), 
        timesBP = dplyr::case_when(
            event_raw == "BP" ~ 0,
            .default = difftime
        ),
        timesBT = dplyr::case_when(
            event_raw == "BT" ~ 0,
            .default = difftime
        ),
        timesPB = dplyr::case_when(
            event_raw == "PB" ~ 0,
            .default = difftime
        ),
        timesPT = dplyr::case_when(
            event_raw == "PT" ~ 0,
            .default = difftime
        ),
        timesTB = dplyr::case_when(
            event_raw == "TB" ~ 0,
            .default = difftime
        ),
        timesTP = dplyr::case_when(
            event_raw == "TP" ~ 0,
            .default = difftime
        ),
        times2 = difftime
    )


res_inla <- INLAjoint::joint(
    formSurv = list(
        inla.surv(timesBP, eventBP, times2) ~ 1, 
        inla.surv(timesBT, eventBT, times2) ~ temperature,
        inla.surv(timesPB, eventPB, times2) ~ temperature,
        inla.surv(timesPT, eventPT, times2) ~ temperature,
        inla.surv(timesTB, eventTB, times2) ~ temperature,
        inla.surv(timesTP, eventTP, times2) ~ 1
    ),
    basRisk = rep("rw1", 6),
    dataSurv = tmp2
)


res_inla2 <- INLAjoint::joint(
    formSurv = list(
        inla.surv(timesBP, eventBP, times2) ~ 1,
        inla.surv(timesBT, eventBT, times2) ~ temperature,
        inla.surv(timesPB, eventPB, times2) ~ temperature,
        inla.surv(timesPT, eventPT, times2) ~ temperature,
        inla.surv(timesTB, eventTB, times2) ~ temperature,
        inla.surv(timesTP, eventTP, times2) ~ 1
    ),
    family = "coxph",
    basRisk = rep("rw1", 6),
    dataSurv = tmp2
)

summary(res_inla2)

res_inla3 <- INLAjoint::joint(
    formSurv = list(
        inla.surv(timesBP, eventBP, times2) ~ 1,
        inla.surv(timesBT, eventBT, times2) ~ temperature,
        inla.surv(timesPB, eventPB, times2) ~ temperature,
        inla.surv(timesPT, eventPT, times2) ~ temperature,
        inla.surv(timesTB, eventTB, times2) ~ temperature,
        inla.surv(timesTP, eventTP, times2) ~ 1
    ),
    family = "weibull",
    basRisk = rep("rw1", 6),
    dataSurv = tmp2
)




## See https://becarioprecario.bitbucket.io/inla-gitbook/ch-survival.html#accelerated-failure-time-models


reshh <- list()
for (i in 1:6) {
    # Transform baseline hazard
    h0 <- lapply(
        res_inla2$marginals.random[[paste0("baseline", i, ".hazard")]],
        function(X) {
            inla.tmarginal(exp, X)
        }
    )
    # Compute summary statistics for plotting
    h0.stats <- lapply(h0, inla.zmarginal)

    h0.df <- data.frame(t = res_inla2$summary.random[["baseline1.hazard"]]$ID)
    reshh[[i]] <- cbind(h0.df, do.call(rbind, lapply(h0.stats, unlist)))

}


risk <- function(i, temp) {
    
}
