#!/bin/bash

##
choco install pandoc
Rscript -e 'blogdown::install_hugo()'
Rscript -e 'blogdown::build_site()'
