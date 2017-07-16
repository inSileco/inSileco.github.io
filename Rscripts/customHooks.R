# knitr::knit_hooks$set(copy = function(before, options, envir) {
#   if (before) {
#     # txt <- "<a class='btn btn-primary btn-outline btn-xs' href='#'><i class='ion-archive'></i></a>"
#     txt <- "<button class='btn' data-clipboard-target='code.r'><i class='ion-archive'></i></button>"
#     return(txt)
#   }
# })
#


# knitr::knit_hooks$set(
#   source = function(x, options) {
#
#     knitr:::set_html_dev()
#     knitr::opts_knit$set(out.format = "markdown")
#
#     xb <- paste(
#       c(knitr:::hilight_source(x, "markdown", options), ""),
#       collapse = "\n"
#     )
#
#     print(xb)
#     txt <- sprintf("<div class='%s' id='%s'><pre class='%s'>%s</pre></div>\\n",
#       tolower(options$engine), options$label, tolower(options$engine), xb)
#     # x <- paste(x, collapse = "\\n")
#     txt <- paste0(txt, "<button class='btn' data-clipboard-text='", "coucou", "'>hhh</button>")
#     cat(txt)
#     txt

    # sprintf("<div class=\\"%s\\"><pre class=\\"knitr %s\\">%s</pre></div>\\n",
    #       name, tolower(knitr::options$engine), x)
    # paste("<pre>", c(knitr:::hilight_source(x, "html", options), ""), "</pre>",
    # "<button class='btn' data-clipboard-text='", x, "'>Copy</button>", sep = "")
  #   }
  # )

# original render markdown

  # knitr::render_markdown <- function(strict = FALSE, fence_char = "`") {
  #     set_html_dev()
  #     opts_knit$set(out.format = "markdown")
  #     fence = paste(rep(fence_char, 3), collapse = "")
  #     hook.t = function(x, options, class = NULL) {
  #         if (strict) {
  #             paste("\\n", indent_block(x), "", sep = "\\n")
  #         }
  #         else {
  #             x = paste(c("", x), collapse = "\\n")
  #             r = paste0("\\n", fence_char, "{3,}")
  #             if (grepl(r, x)) {
  #                 l = attr(gregexpr(r, x)[[1]], "match.length")
  #                 l = max(l)
  #                 if (l >= 4)
  #                   fence = paste(rep(fence_char, l), collapse = "")
  #             }
  #             paste0("\\n\\n", fence, block_class(class), x, fence,
  #                 "\\n\\n")
  #         }
  #     }
  #     hook.o = function(x, options) {
  #         hook.t(x, options, options$class.output)
  #     }
  #     hook.r = function(x, options) {
  #         language = tolower(options$engine)
  #         if (language == "node")
  #             language = "javascript"
  #         if (!options$highlight)
  #             language = "text"
  #         if (!is.null(options$class.source)) {
  #             language = block_class(c(language, options$class.source))
  #         }
  #         paste0("\\n\\n", fence, language, "\\n", x, fence, "\\n\\n")
  #     }
  #     knit_hooks$set(source = function(x, options) {
  #         x = hilight_source(x, "markdown", options)
  #         (if (strict)
  #             hook.t
  #         else hook.r)(paste(c(x, ""), collapse = "\\n"), options)
  #     }, output = hook.o, warning = hook.t, error = hook.t, message = hook.t,
  #         inline = function(x) {
  #             fmt = pandoc_to()
  #             fmt = if (length(fmt) == 1L)
  #                 "latex"
  #             else "html"
  #             .inline.hook(format_sci(x, fmt))
  #         }, plot = hook_plot_md, chunk = function(x, options) {
  #             x = gsub(paste0("[\\n]{2,}(", fence, "|    )"), "\\n\\n\\\\1",
  #                 x)
  #             x = gsub("[\\n]+$", "", x)
  #             x = gsub("^[\\n]+", "\\n", x)
  #             if (isTRUE(options$collapse)) {
  #                 x = gsub(paste0("\\n([", fence_char, "]{3,})\\n+\\\\1(",
  #                   tolower(options$engine), ")?\\n"), "\\n", x)
  #             }
  #             if (is.null(s <- options$indent))
  #                 return(x)
  #             line_prompt(x, prompt = s, continue = s)
  #         })
  # }



# Below I added the original render_html() function from knitr
# function ()
# {
#     set_html_dev()
#     opts_knit$set(out.format = "html")
#     html.hook = function(name) {
#         force(name)
#         function(x, options) {
#             x = if (name == "source") {
#                 c(hilight_source(x, "html", options), "")
#             }
#             else escape_html(x)
#             x = paste(x, collapse = "\\n")
#             sprintf("<div class=\\"%s\\"><pre class=\\"knitr %s\\">%s</pre></div>\\n",
#                 name, tolower(options$engine), x)
#         }
#     }
#     h = opts_knit$get("header")
#     if (!nzchar(h["highlight"]))
#         set_header(highlight = .header.hi.html)
#     z = list()
#     for (i in c("source", "warning", "message", "error")) z[[i]] = html.hook(i)
#     knit_hooks$set(z)
#     knit_hooks$set(inline = function(x) {
#         sprintf(if (inherits(x, "AsIs"))
#             "%s"
#         else "<code class=\\"knitr inline\\">%s</code>", .inline.hook(format_sci(x,
#             "html")))
#     }, output = html.hook("output"), plot = hook_plot_html, chunk = .chunk.hook.html)
# }
