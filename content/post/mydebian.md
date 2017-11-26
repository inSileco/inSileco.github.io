---
title: My Debian Stretch setup
author: [kevin]
date: 2017-11-25
tags: [Linux, Debian, setup]
draft: true
tweet: My Debian Stretch setup
output:
  rmarkdown::html_page:
    toc: true
    fig_width: 3
    dev: svg
---


![](https://img.shields.io/badge/inSileco-InDevelopment-3fb3b2.svg)


This post details my Debian Stretch setup on my Lenovo Think Pad T470p. I take
this opportunity to give the reasons why I move from MacOS to Debian as well as
some elements concerning about my hardware and the softwares I use. If you have
any comments/question please feel free to use the Disqus section below.  


# Go Debian

## From MacOS to Linux

I have been a MacOS user for a long time mainly because my father was
a MacOS user him-self. I remember back to 2005 how weird it sounded to be a
Mac aficionado  compare to how trendy it is nowadays. Well according to me, Apple
still make good computers and the money spend on a their is worth the performance.
However, given the trend of making computer as thin as possible, a Mac user has
less [control over his hardware](https://www.theinquirer.net/inquirer/news/2404318/ifixit-apples-12in-macbook-is-near-impossible-to-repair).
I and given the costs associated with having a Mac (adapter, repair costs, etc.)
owning a Mac progressively became way less appealing to me. Moreover, I noticed
how rare it was for me to use a MacOS's (I used [homebrew](https://brew.sh/) as
package manager and as many freeware as possible and my list of
[software](https://gist.github.com/KevCaz/e89f5584d4c5c9c92c4e) was
similar to the one I present below). Therefore I had no valid reason to keep
using MacOS and so I decided to go Linux, so far so good :smile:.


## Why Debian?

The choice of Linux distribution is pretty wide as you can see on the
[wikipedia page](https://en.wikipedia.org/wiki/List_of_Linux_distributions).
As I had only a little experience with Linux (I have already used Ubuntu on
university's computer and Raspbian on my [Raspberry Pi](https://www.raspberrypi.org/))
I had no strong opinion but I wanted something different from Ubuntu and
I was very happy with Raspbian I said to myself let's go Debian *the mother
of many linux distributions*.

I do not want to go into much details about Debian first because I am no
Debian expert and second because you will learn way more by searching on the
web by yourself especially on the [official website](https://www.debian.org/).
However, I think it would be useful to give a few very general ideas about its
development (what I understand now) and discuss the common opinion
(at least the one I got fronm reading about it before using it) that Debian is
very stable but always provide old version of software.

*to be added: a figure that displays how Debian works*

Currently (when I shared this post)  https://www.debian.org/releases/

- unstable: Cid   
- testing: Buster   
- stable: Stretch   
- old stable: Jessie, Wheezy and previous

http://www.zdnet.com/article/debian-stable-or-debian-testing-which-linux-is-right-for-you/



## My hardware

Unfortunately I cannot tell you I do not have strong knowledge. I have look and
ask people around me and the guy in charge of the computers purchasing in my
department at the university. Combining all those subjective advice and some reading
on the Internet claiming that Lenovo have a good Linux compatibility and decided
to go for a Lenovo computer. Once I made my mind regarding the brand, I have
spend some time to think about my general expectation: a laptop, medium-size
screen (13-15"), a good i7 processor, no less than 8Go of RAM, and at least
500Go SSD storage for less than 3000$Can warranty included.I finally decided to
buy a customized [Lenovo T470p]() and below are a couple of detail about this
computer I gather using inxi (one of the software I have installed; if you are
interested in free command line tools that returns information about your
hardware I recommend [this post on binarytides](http://www.binarytides.com/linux-commands-hardware-info/)));
the command `inxi -SMGCADP` entered in my terminal returns:


```
System:    Host: debian Kernel: 4.9.0-4-amd64 x86_64 (64 bit) Desktop: Gnome 3.22.3
           Distro: Debian GNU/Linux 9 (stretch)
Machine:   Device: laptop System: LENOVO product: 20J7S0SU00 v: ThinkPad T470p
           Mobo: LENOVO model: 20J7S0SU00 v: SDK0J40709 WIN
           UEFI: LENOVO v: R0FET31W (1.11 ) date: 03/10/2017
Battery    BAT0: charge: 40.2 Wh 61.0% condition: 65.9/71.1 Wh (93%)
CPU:       Quad core Intel Core i7-7820HQ (-HT-MCP-) cache: 8192 KB
           clock speeds: max: 3900 MHz 1: 899 MHz 2: 899 MHz 3: 900 MHz 4: 900 MHz
           5: 899 MHz 6: 900 MHz 7: 899 MHz 8: 899 MHz
Graphics:  Card-1: Intel Device 591b
           Card-2: NVIDIA GM108M [GeForce 940MX]
           Display Server: X.Org 1.19.2 driver: N/A Resolution: 1920x1080@59.96hz
           GLX Renderer: Mesa DRI Intel Kabylake GT2 GLX Version: 3.0 Mesa 13.0.6
Audio:     Card Intel Device a171 driver: snd_hda_intel Sound: ALSA v: k4.9.0-4-amd64
Drives:    HDD Total Size: NA (-)
           ID-1: /dev/nvme0n1 model: N/A size: 1024.2GB
Partition: ID-1: / size: 922G used: 61G (7%) fs: ext4 dev: /dev/nvme0n1p2
           ID-2: swap-1 size: 17.03GB used: 0.00GB (0%) fs: swap dev: /dev/nvme0n1p3
```



## Hello and good bye Windows 10

The Lenovo came with was furnished with Windows 10 (note that for that model
I did not have the choice of the OS, sadly). Well, I am no Windows
user and do not intend to become one, so I had to get rid of Windows and
install Debian Stretch.


### Get a bootable USB stick

The Debian version you need is available on the [official website]( https://www.debian.org/releases/stretch/debian-installer/) I needed the
amd64 for bootale USB stick. I did that a couple time but I did not
remember right away so I googled sonthing like "bootable USB key Debian Stretch"
and got an answer similar to [this conversation on stackechange](https://unix.stackexchange.com/questions/293969/how-to-make-bootable-debian-usb-on-mac)
(remember I went from MacOS to Linix).


### A small modification in the BIOS

 > BIOS ([...] an acronym for Basic Input/Output System and also known as the System BIOS, ROM BIOS or PC BIOS) is non-volatile firmware used to perform hardware initialization during the booting process (power-on startup), and to provide runtime services for operating systems and programs. (https://en.wikipedia.org/wiki/BIOS)

Before you can go to your OS you have step and it cannot prevent you from installing a new
OS by default. So I have to change this to be able to install Debian. On Lenovo
ThinkPad when booting your computer and Lenovo page pop up and say that if
you want to something type enter so I did I navigate in the menu up to security.



### Ethernet

I was then able to put on a USB device but I had to use a ethernet cable
because I needed a non-free firmware to use the Wi-Fi. Once plugged
on a ethernet cable everything went great and I seamless
less follow the different steps and Debian Stretch was installed with
Gnome and a collection of useful software inluding LibreOffice, Inkscape and
a couple of funny old-school styled egames (*i.e.* Nibbles, Mines).

Unfortunately I did not record all I did but basically is is similar at
what you can found on [that post by ... ](to beadded). So Debian installed
I had to complete my setup by select he software I'll use.



# Setting my Debian Stretch up?

<!-- I use a fair number of software (note that some of them I seldom use). But
I know that using the package manager is useful and I only need to script them -->

## Gnome, Gnome and shortcuts

I made three short video to show you how

1- to get the gnome version you are using with the GUI;   
2- where to look for to tweak even more;    
3- where to find and add keyboard bindings (for instance to record the screencast
below `ctrl+alt+shift+R`).    

### Gnome version

<video width="100%" controls>
 <source src="/assets/myDebianStretch/gnomeVersion.webm" type="video/webm">
 Your browser does not support the video tag.
</video>

<br>

### Gnome-Tweak-Tool

<video width="100%" controls>
 <source src="/assets/myDebianStretch/gnomeTweak.webm" type="video/webm">
 Your browser does not support the video tag.
</video>

<br>

### Keyboard bindings

<video width="100%" controls>
 <source src="/assets/myDebianStretch/shortcuts.webm" type="video/webm">
 Your browser does not support the video tag.
</video>

<br>

## The list of software

Here is the gist I used to keep track of what I install (it is basically a
bash script I can use to re-install my computer). To be able to fully reproduce
this you need to change a few lines in the [sources list](https://wiki.debian.org/SourcesList)
as follows:

```
deb http://debian.mirror.rafal.ca/debian/ stretch main contrib non-free
deb-src http://debian.mirror.rafal.ca/debian/ stretch main
deb http://security.debian.org/debian-security stretch/updates main
deb-src http://security.debian.org/debian-security stretch/updates main

# stretch-updates, previously known as 'volatile'
deb http://debian.mirror.rafal.ca/debian/ stretch-updates main
deb-src http://debian.mirror.rafal.ca/debian/ stretch-updates main

# R verison 3.4.x
deb http://cran.utstat.utoronto.ca/bin/linux/debian stretch-cran34/

# Qgis
deb http://qgis.org/debian stretch main
deb-src http://qgis.org/debian stretch main

# Papirus icon
deb http://ppa.launchpad.net/papirus/papirus/ubuntu xenial main
deb-src http://ppa.launchpad.net/papirus/papirus/ubuntu xenial main
```


If you are a Homebrew user different repositories in your source list is like
having different taps. You should also have a look at the page on the official
website about
https://wiki.debian.org/fr/UnofficialRepositories
https://wiki.debian.org/dropbox
https://wiki.debian.org/skype

and if you wonder what is the difference between `deb` and `deb-src` go on
[stackexachange](https://unix.stackexchange.com/questions/20504/the-difference-between-deb-versus-deb-src-in-sources-list). Once you are aware about those, have a look at my gist (version
  124 when I first shared this post).

<br>

<script src="https://gist.github.com/KevCaz/29536740b9150383a9d543ec1be96103.js"></script>

<br>




<img src="/assets/myDebianStretch/after.png" width="100%">
</img>


Below is a table with link if you want know more about the software I use

**add a table/script**


As you can see for some of them I want a version newer than the one Debian
stable. I use the same strategy:

1. `wget` and save the `.deb` file in the temporary folder `/tmp/`
2. install them with `dpkg` `sudo dpkg -i xxxx.deb`

Pandoc and hugo 

<!-- test whether the download work -->





# Design

Add a repository

<img src="/assets/myDebianStretch/look.png" width="100%">
</img>


# Issues

## Various message on log



## Back light

many solutions online none of them resolve my issue (note I may have misuderstood /
  badly ) however on the time I got how it words. and came out with and a simple
  command I added to my profile *jouter lien dotfiles*

that's something I really like with that it has forced me to understand and even
if my problem is not solved I found a solution and I make few step further
towards understand I can potentielly contrubuted to debian at sone point (the
  journey is still long) the dmesag command





## A note about github password

https://confluence.atlassian.com/bitbucketserver/permanently-authenticating-with-git-repositories-776639846.html

We can only cache...





## Firefox
CRON Jobber
sudo crontab -e  
stay tune // stop update by and cron it
Extension manager... in Tools + img
