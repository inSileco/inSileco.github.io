tmp <- yaml::read_yaml('../../static/assets/myDebianStretch/debian.yaml')

txt <- ""

for (i in 1:length(tmp)) {
  txt %<>% paste0('- ', tmp[[i]]$name, ' \n')
}

cat(txt)
