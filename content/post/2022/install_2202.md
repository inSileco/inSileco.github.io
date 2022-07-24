---
title: Ubuntu 22.04 quick R setup
author: [kevin]
date: 2022-07-24
tags: [R, tips, trickortips]
rpkgs: [base, utils, graphics]
tweet: "Quick setup"
draft: true
estime: 5
output:
  blogdown::html_page:
    dev: svglite
---


In thus post I will install ubutun from scratch then will examplify different way to install application and then install R different editors. This is not meant to be exhaustif but show different ways to proceed,


Ubuntu 22.04 has been released last April, I just be released.

Say you are already


Canonical Ubuntu 22.04 LTS is released | Ubuntu

https://cdimage.ubuntu.com/daily-live/current/


It's ISO so easy to sync


```sh
sudo  fdisk --list
duf
```

Then quickly

```sh
umount /dev/sda1
sudo dd if=jammy-desktop-amd64.iso of=/dev/sda1 bs=100M status=progress oflag=sync
```

I took 5min5s not bad 3.7Go on a fairly old usb stcick.

block size I was fairl quick with 100M do no much more where this was a good setting or not.


Then follow the steone think I'vre realize os that


# Set Up

```sh
sudo apt install \
    byobu curl duf emacs ess fonts-firacode gpick htop inxi pandoc pass zsh \
    docker.io hugo hunspell hunspell-fr taskwarrior \
    calibre nextcloud-desktop vlc xournal
```

```sh
sudo snap install brave zoom-client
```

Then use with flatpak, note that snap also a choice, especially on Ubuntu...
Still I prefer flatpak.

```sh
sudo apt-get install flatpak
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
sudo flatpak install -y flathub \
    com.discordapp.Discord com.slack.Slack org.zotero.Zotero \
    org.musicbrainz.Picard
```

mkdir ~/Apps
pushd ~/Apps
git clone https://github.com/JuliaLang/julia.git julialang
cd julialang && git checkout v1.7.2 && make
popd




There are application I use and install

https://cli.github.com/

https://github.com/cli/cli/blob/trunk/docs/install_linux.md

```sh
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt update
sudo apt install gh
```


https://github.com/sharkdp/pastel

```sh
wget "https://github.com/sharkdp/pastel/releases/download/v0.8.1/pastel_0.8.1_amd64.deb"
sudo dpkg -i pastel_0.8.1_amd64.deb
rm pastel_0.8.1_amd64.deb
```


python3-pip
pip3 install --user numpy scipy matplotlib bpython radian \
    pandoc-fignos pandoc-tablenos pandoc-eqnos


# R setup


## R and R package



pip3 install --user radian


echo "deb [arch=amd64] https://dirk.eddelbuettel.com/cranapt focal main" \
    > /etc/apt/sources.list.d/cranapt.list
apt update

apt install --yes --no-install-recommends wget      # to add the key
wget -q -O- https://eddelbuettel.github.io/r2u/assets/dirk_eddelbuettel_key.asc \
    | tee -a /etc/apt/trusted.gpg.d/cranapt_key.asc

sudo wget -q -O- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc \
    | sudo tee -a /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc
sudo echo "deb [arch=amd64] https://cloud.r-project.org/bin/linux/ubuntu jammy-cran40/" > /etc/apt/sources.list.d/cran-ubuntu.list


As a first steetup I like using and. Makes easier to hanvke. Then I may use smething to udate than,
but still the .


Here it come

Migration tip:

- .Renviron.site
- .Rprofile


r-cran-devtools
r-cran-tidyverse
r-cran-mapview
r-cran-terra


https://eddelbuettel.github.io/r2u/

# IDE

## RStudio

Some discussion https://github.com/rstudio/rstudio/issues/3079

https://www.rstudio.com/products/rstudio/download/#download

## Radian

Based on ...

Very popular not using dit often but always good to have it for demo.



I use and so

Based on ...

## Visual Code

Definitively recommend R and use

## Atom



## Emac

Not using yet but this is something I want to

## Radian


https://www.rstudio.com/products/rstudio/download-server/debian-ubuntu/


 apt show r-cran-devtools                                                        [08:52:48]
Package: r-cran-devtools
Version: 2.4.3-1cran1.2004.0
Priority: optional
Section: gnu-r
Source: devtools
Maintainer: cran2deb4ubuntu <cran2deb4ubuntu@gmail.com>
Installed-Size: 545 kB
Depends: r-base-core, r-cran-usethis, r-cran-callr, r-cran-cli, r-cran-desc, r-cran-ellipsis, r-cran-fs, r-cran-httr, r-cran-lifecycle, r-cran-memoise, r-cran-pkgbuild, r-cran-pkgload, r-cran-rcmdcheck, r-cran-remotes, r-cran-rlang, r-cran-roxygen2, r-cran-rstudioapi, r-cran-rversions, r-cran-sessioninfo, r-cran-testthat, r-cran-withr


apt show r-cran-devtools                                                                [21:53:56]
Package: r-cran-devtools
Version: 2.4.3-1
Priority: optional
Section: universe/gnu-r
Origin: Ubuntu
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
Original-Maintainer: Debian R Packages Maintainers <r-pkg-team@alioth-lists.debian.net>
Bugs: https://bugs.launchpad.net/ubuntu/+filebug
Installed-Size: 943 kB
Depends: r-base-core (>= 4.1.2-1ubuntu1), r-api-4.0, r-cran-usethis (>= 2.0.1), r-cran-callr (>= 3.6.0), r-cran-cli (>= 3.0.0), r-cran-desc (>= 1.3.0), r-cran-ellipsis (>= 0.3.1), r-cran-fs (>= 1.5.0), r-cran-httr (>= 1.4.2), r-cran-lifecycle (>= 1.0.0), r-cran-memoise (>= 2.0.0), r-cran-pkgbuild (>= 1.2.0), r-cran-pkgload (>= 1.2.1), r-cran-rcmdcheck (>= 1.3.3), r-cran-remotes (>= 2.3.0), r-cran-rlang (>= 0.4.10), r-cran-roxygen2 (>= 7.1.1), r-cran-rstudioapi (>= 0.13), r-cran-rversions (>= 2.0.2), r-cran-sessioninfo (>= 1.1.1), r-cran-testthat (>= 3.0.2), r-cran-withr (>= 2.4.1)
Recommends: r-cran-mass, r-cran-knitr (>= 1.31), r-cran-bitops, r-cran-rmarkdown (>= 2.7), r-cran-mockery (>= 0.4.2)
Suggests: r-cran-biocmanager (>= 1.30.12), r-cran-covr (>= 3.5.1), r-cran-curl (>= 4.3), r-cran-digest (>= 0.6.27), r-cran-dt (>= 0.17), r-cran-gh (>= 1.2.1), r-cran-pingr (>= 2.0.1), r-cran-spelling (>= 2.2)
Homepage: https://cran.r-project.org/package=devtools
Download-Size: 675 kB
APT-Sources: http://ca.archive.ubuntu.com/ubuntu jammy/universe amd64 Packages
Description: Tools to Make Developing R Packages Easier
 Collection of package development tools.

sudo apt install r-cran-devtools 

 0 upgraded, 361 newly installed, 0 to remove and 0 not upgraded.
Need to get 277 MB of archives.
After this operation, 572 MB of additional disk space will be used.
Do you want to continue? [Y/n] Y


apt show r-cran-mapview                                                                 [22:10:36]
Package: r-cran-mapview
Version: 2.11.0-1.ca2204.1
Priority: optional
Section: gnu-r
Maintainer: Dirk Eddelbuettel <edd@debian.org>
Installed-Size: 2,578 kB
Depends: r-base-core (>= 4.2.0), r-api-4.0, r-cran-base64enc, r-cran-htmltools, r-cran-htmlwidgets, r-cran-lattice, r-cran-leafem, r-cran-leaflet, r-cran-leafpop, r-cran-png, r-cran-raster, r-cran-satellite, r-cran-scales, r-cran-servr, r-cran-sf, r-cran-sp, r-cran-webshot
Suggests: r-cran-covr, r-cran-knitr, r-cran-later, r-cran-leaflet.extras2, r-cran-leafsync, r-cran-lwgeom, r-cran-mapdeck, r-cran-plainview, r-cran-poorman, r-cran-rgdal, r-cran-rmarkdown, r-cran-rstudioapi, r-cran-s2, r-cran-stars, r-cran-tinytest
Homepage: https://cran.r-project.org/package=mapview
Download-Size: 2,311 kB
APT-Sources: https://dirk.eddelbuettel.com/cranapt jammy/main all Packages
Description: CRAN Package 'mapview' (Interactive Viewing of Spatial Data in R)
 Quickly and conveniently create interactive visualisations of spatial data
 with or without background maps.  Attributes of displayed features are fully
 queryable via pop-up windows. Additional functionality includes methods to
 visualise true- and false-color raster images and bounding boxes.



https://linuxize.com/post/how-to-create-groups-in-linux/

https://www.howtogeek.com/50787/add-a-user-to-a-group-or-second-group-on-linux/

groupadd rusers
sudo usermod -aG rusers $USER


sudo chown kc /usr/local/lib/R/site-library

**Installing package into ‘/usr/local/lib/R/site-library’
(as ‘lib’ is unspecified)
Warning in i.p(...) :
  'lib = "/usr/local/lib/R/site-library"' is not writable
Would you like to use a personal library instead? (yes/No/cancel)                                                     

**



 ❯ ls -l /usr/local/lib/R/                                                                                 [10:33:15]
total 27
drwxr-xr-x 3 root root 3 Jul 16 07:52 .
drwxr-xr-x 4 root root 4 Jul 16 07:52 ..
drwxr-xr-x 2 root root 2 Jul 16 07:52 site-library

 kc@bender  ~/g/i/inSileco.github.io   main ⁝ ? 
 ❯ chown -R kc:rusers /usr/local/lib/R/site-library                                                        [10:33:40]
chown: changing ownership of '/usr/local/lib/R/site-library': Operation not permitted

 ✘ kc@bender  ~/g/i/inSileco.github.io   main ⁝ ? 
 ❯ sudo chown -R kc:rusers /usr/local/lib/R/site-library                                                   [10:33:43]

 kc@bender  ~/g/i/inSileco.github.io   main ⁝ ? 
 ❯ ls -l /usr/local/lib/R/                                                                                 [10:33:46]
total 27
drwxr-xr-x 3 root root   3 Jul 16 07:52 .
drwxr-xr-x 4 root root   4 Jul 16 07:52 ..
drwxr-xr-x 2 kc   rusers 2 Jul 16 07:52 site-library


sudo chown -R :rusers /usr/local/lib/R/site-library


sudo apt install --install-suggests 'r-cran-rcpp*'
r-cran-bibtex r-cran-rfishbase r-cran-magick r-cran-animation r-cran-kableextra
r-cran-pagedown r-cran-xaringan r-cran-latex2exp

$ ln -s /usr/share/hunspell/* ~/.config/Code/Dictionaries