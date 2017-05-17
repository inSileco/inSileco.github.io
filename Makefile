# Rscript --no-site-file --no-init-file -e "rmarkdown::render_site('index.Rmd')"
postr := $(wildcard _posts/*.Rmd)
posth := $(patsubst _posts/%, docs/%, $(patsubst %.Rmd, %.html, $(postr)))
mainr := $(wildcard _main/*.Rmd)
mainh := $(patsubst _main/%, docs/%, $(patsubst %.Rmd, %.html, $(mainr)))
indr := $(wildcard ./*.Rmd)
dat = $(shell date "+%d-%m-%Y")

all: docs/index.html $(mainh) $(posth)

docs/%.html: _posts/%.Rmd
	cp $< ./
	Rscript --no-init-file -e "rmarkdown::render_site('$(patsubst _posts/%,%,$<)')"
	rm $(patsubst _posts/%,%,$<)

docs/%.html: _main/%.Rmd
	cp $< ./
	Rscript --no-init-file -e "rmarkdown::render_site('$(patsubst _main/%,%,$<)')"
	rm $(patsubst _main/%,%,$<)

docs/index.html: $(indr)
	gsed -i "s/update: [0-9\-]*./update: $(dat)./" footer.html
	Rscript --no-init-file -e "rmarkdown::render_site()"
	rm -rf docs/tmp_files


reveal:
	Rscript --no-init-file -e "for (i in list.files('pres', pattern='*.Rmd', full.names=T)) rmarkdown::render(i)"

clean:
	Rscript --no-init-file -e "rmarkdown::clean_site()"
