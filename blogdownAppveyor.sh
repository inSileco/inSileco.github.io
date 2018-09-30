#!/bin/bash

## Latest pandoc version
# PANDOC_VERSION='2.1.3'
# PANDOC_DIR="${HOME}/opt/pandoc"
# PANDOC_URL="https://s3.amazonaws.com/rstudio-buildtools/pandoc-${PANDOC_VERSION}.zip"
# local os_path="$1"
# wget https://github.com/jgm/pandoc/releases/download/2.1.3/pandoc-2.1.3-1-amd64.deb -O /tmp/pandoc-${PANDOC_VERSION}.zip
# mkdir -p "${PANDOC_DIR}"
# curl -o /tmp/pandoc-${PANDOC_VERSION}.zip ${PANDOC_URL}
# unzip -j /tmp/pandoc-${PANDOC_VERSION}.zip "pandoc-${PANDOC_VERSION}/${os_path}/pandoc" -d "${PANDOC_DIR}"
# chmod +x "${PANDOC_DIR}/pandoc"
# sudo ln -s "${PANDOC_DIR}/pandoc" /usr/local/bin
# unzip -j /tmp/pandoc-${PANDOC_VERSION}.zip "pandoc-${PANDOC_VERSION}/${os_path}/pandoc-citeproc" -d "${PANDOC_DIR}"
# chmod +x "${PANDOC_DIR}/pandoc-citeproc"
# sudo ln -s "${PANDOC_DIR}/pandoc-citeproc" /usr/local/bin

##
Rscript -e 'blogdown::install_hugo()'
Rscript -e 'blogdown::build_site()'
