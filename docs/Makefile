# Rscript --no-site-file --no-init-file -e "rmarkdown::render_site('index.Rmd')"
postr := $(wildcard _posts/*.Rmd)
postt  = $(patsubst _posts/%, %, $(postr))
posth := $(patsubst _posts/%, docs/%, $(patsubst %.Rmd, %.html, $(postr)))
#
mainr := $(wildcard _main/*.Rmd)
maint =  $(patsubst _main/%, %, $(mainr))
mainh := $(patsubst _main/%, docs/%, $(patsubst %.Rmd, %.html, $(mainr)))
#
rscr := $(wildcard Rscripts/*.R)
indr := index.Rmd
dat = $(shell date "+%d-%m-%Y")


all: docs/index.html $(mainh) $(posth)

docs/%.html: _posts/%.Rmd #Rscripts/readYaml.R
	cp $< ./
	Rscript --no-restore-history --no-init-file -e "rmarkdown::render_site('$(patsubst _posts/%,%,$<)')"
	rm $(patsubst _posts/%, %, $<)

docs/%.html: _main/%.Rmd #$(rscr)
	cp $< ./
	Rscript --no-restore-history --no-init-file -e "rmarkdown::render_site('$(patsubst _main/%,%,$<)')"
	rm $(patsubst _main/%, %, $<)

docs/index.html: $(indr) _site.yml css/* data/* assets/*
	gsed -i "s/update: [0-9\-]*./update: $(dat)./" footer.html
	Rscript --no-init-file -e "rmarkdown::render_site('$<')"


rebuildall:
	cp $(postr) $(mainr) ./
	Rscript --no-restore-history --no-init-file -e "rmarkdown::render_site('.')"
	rm $(postt) $(maint)

newpost:
	cp _template/emptyPost.md _posts/

wordcloud:
	Rscript --no-init-file ./Rscripts/ourWordcloud.R

# index:

reveal:
	Rscript --no-init-file -e "for (i in list.files('pres', pattern='*.Rmd', full.names=T)) rmarkdown::render(i)"

cleanpost:
	rm $(postt) $(maint) $(patsubst docs/%, %, $(posth)) $(patsubst docs/%, %, $(mainh))

clean:
	Rscript --no-init-file -e "rmarkdown::clean_site(".")"
