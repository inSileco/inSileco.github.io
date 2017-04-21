# Rscript --no-site-file --no-init-file -e "rmarkdown::render_site('index.Rmd')"
d = `date "+%d-%m-%Y"`

website:
	sed -e "s/update: [0-9\-]*./update: $d./g" footer.html > footer.html
	Rscript --no-site-file --no-init-file -e 'rmarkdown::render_site()'

reveal:
	Rscript --no-site-file --no-init-file -e "for (i in list.files('pres', pattern='*.Rmd', full.names=T)) rmarkdown::render(i)"

clean:
	Rscript --no-site-file --no-init-file -e "rmarkdown::clean_site()"
