d = `date "+%d-%m-%Y"`

website:
	sed -ie "s/update: [0-9\-]*./update: $d./g" footer.html
	Rscript --no-site-file --no-init-file -e 'rmarkdown::render_site()'

reveal:
	Rscript --no-site-file --no-init-file -e "for (i in list.files('pres', pattern='*.Rmd', full.names=T)) rmarkdown::render(i)"
