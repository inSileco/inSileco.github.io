biblio:
	cd static/ref && Rscript createRefList.R

check: 
	Rscript -e 'blogdown::check_config(); check_content()'

build:
	Rscript -e 'blogdown::build_site()'

serve:
	Rscript -e 'blogdown::serve_site()'
