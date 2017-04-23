# Rscript --no-site-file --no-init-file -e "rmarkdown::render_site('index.Rmd')"
dat = $(shell date "+%d-%m-%Y")

website:
	gsed -i "s/update: [0-9\-]*./update: $(dat)./" footer.html
	Rscript --no-site-file --no-init-file -e 'rmarkdown::render_site()'
	rm -rf docs/tmp_files docs/drafts

reveal:
	Rscript --no-site-file --no-init-file -e "for (i in list.files('pres', pattern='*.Rmd', full.names=T)) rmarkdown::render(i)"

clean:
	Rscript --no-site-file --no-init-file -e "rmarkdown::clean_site()"
