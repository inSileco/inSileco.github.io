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

docs/%.html: _posts/%.Rmd Rscripts/addStatus.R
	cp $< ./
	Rscript --no-restore-history --no-init-file Rscripts/purlIt.R $(patsubst _posts/%, %, $<)
	Rscript --no-restore-history --no-init-file -e "rmarkdown::render_site('$(patsubst _posts/%,%,$<)')"
	rm $(patsubst _posts/%, %, $<)

docs/about.html: _main/about.Rmd data/authors_info.yml Rscripts/addAuthorsLinks.R Rscripts/textAuthors.R
	cp $< ./
	Rscript --no-restore-history --no-init-file -e "rmarkdown::render_site('$(patsubst _main/%,%,$<)')"
	rm $(patsubst _main/%, %, $<)

docs/maps.html: _main/maps.Rmd data/maps.yml Rscripts/maps.R
	cp $< ./
	Rscript --no-restore-history --no-init-file -e "rmarkdown::render_site('$(patsubst _main/%,%,$<)')"
	rm $(patsubst _main/%, %, $<)

docs/softwares.html: _main/softwares.Rmd data/softwares.yml Rscripts/softwares.R
	cp $< ./
	Rscript --no-restore-history --no-init-file -e "rmarkdown::render_site('$(patsubst _main/%,%,$<)')"
	rm $(patsubst _main/%, %, $<)

docs/talks.html: _main/talks.Rmd data/talks.yml Rscripts/talks.R
	cp $< ./
	Rscript --no-restore-history --no-init-file -e "rmarkdown::render_site('$(patsubst _main/%,%,$<)')"
	rm $(patsubst _main/%, %, $<)

docs/index.html: $(indr) data/univ.yml data/authors_info.yml Rscripts/addAuthorsLinks.R Rscripts/mapAuthors.R
	gsed -i "s/update: [0-9\-]*./update: $(dat)./" footer.html
	Rscript --no-init-file -e "rmarkdown::render_site('$<')"




rebuildall:
	cp $(postr) $(mainr) _template/indexPosts.Rmd ./
	Rscript --no-restore-history --no-init-file -e "rmarkdown::render_site('.')"
	rm $(postt) $(maint) $(patsubst _template/%, %, _template/indexPosts.Rmd)

newpost:
	cp _template/emptyPost.md _posts/

wordcloud:
	Rscript --no-init-file ./Rscripts/ourWordcloud.R

index: _template/indexPosts.Rmd
	cp $< ./
	Rscript --no-restore-history --no-init-file -e "rmarkdown::render_site('$(patsubst _template/%,%,$<)')"
	rm $(patsubst _template/%, %, $<)

reveal:
	Rscript --no-init-file -e "for (i in list.files('pres', pattern='*.Rmd', full.names=T)) rmarkdown::render(i)"

cleanpost:
	rm $(postt) $(maint) $(patsubst docs/%, %, $(posth)) $(patsubst docs/%, %, $(mainh))

clean:
	Rscript --no-init-file -e "rmarkdown::clean_site('.')"
