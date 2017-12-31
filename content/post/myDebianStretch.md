---
title: My Debian Stretch setup
author: [kevin]
date: 2017-11-27
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



This post details my Debian Stretch setup on my Lenovo Think Pad T470p.
I got this new machine in August 2017 so I have a 5 month experience and I have already learn a lot. I thought is was a good moment  to give the reasons why I moved from MacOS to Debian as well as
some elements regarding my hardware and the set of software I installed. Any
comments/questions about what follows? Feel free to use the Disqus following the
post.



# Go Debian

## From MacOS to Linux

I have been a MacOS user for a long time mainly because my father was
a MacOS user him-self. I remember back to 2005 how weird it sounded to be a
Mac aficionado compare to how trendy it is nowadays. According to me, Apple
still makes good computers and the money spend on them is worth the performance.
However, given the trend of making computer as thin as possible, a Mac user has
less and less
[control over his hardware](https://www.theinquirer.net/inquirer/news/2404318/ifixit-apples-12in-macbook-is-near-impossible-to-repair)
and given the costs associated with having a Mac (adapters, repair costs, etc.)
owning a Mac progressively became way less appealing to me. Moreover, since I
started to do more and more coding I realized how rarely I used Apple's
softwares and use as many freeware as possible instead
(the list of [softwares](https://gist.github.com/KevCaz/e89f5584d4c5c9c92c4e) I
used on my MacOS is actually very similar to the one I use on Debian and that
I present below). It therefore occurs to me that I had no valid reason
to keep using MacOS and I decided to go Linux. So far soooooo good :smile:.


## Why Debian?

<<<<<<< HEAD
The choice of Linux distribution is pretty wide as you can see on the
[wikipedia page](https://en.wikipedia.org/wiki/List_of_Linux_distributions).
As I had only a little experience with Linux, mainly Ubuntu (on university's
computers) and Raspbian (on my [Raspberry Pi](https://www.raspberrypi.org/)),
I had no strong opinions. After a couple of readings comparing Linux distributions
I conclude that what matters the most was my motivation to learn more and
I decided to go Debian *the mother of many linux distributions*.

I do not want to go into much details about Debian first because I am no
expert (and afraid I could be wrong) and second because you will learn way more
by searching on the web by yourself especially on the [official website](https://www.debian.org/).
I think it is nonetheless useful to have a broad ideas about its
development. Basically there are [four different kind of Debian releases](https://www.debian.org/releases/) named after Toy Story's characters:

- unstable: always named [Sid](http://pixar.wikia.com/wiki/Sid_Phillips);
- testing: currently [Buster](http://pixar.wikia.com/wiki/Buster);  
- stable: currently [Stretch](http://pixar.wikia.com/wiki/Buster) (Debian 9);   
- old stable: [Jessie](http://pixar.wikia.com/wiki/Jessie), [Wheezy](http://pixar.wikia.com/wiki/Wheezy) and previous.

Once the release choosen we  
Let's now consider the Debian packages found on the [Debian mirrors]()
As explained in [this post by J.A. Watson](http://www.zdnet.com/article/debian-stable-or-debian-testing-which-linux-is-right-for-you/)
new debian package first entered the Debian process throught the instabke
A new package or a new version forst enter thorugh the unstable release
before testeing, I was not awawre and decided to install the stable released
and released recenlty.
=======
The choice of Linux distribution is **huge** as you can see on the
[wikipedia page](https://en.wikipedia.org/wiki/List_of_Linux_distributions) .
As I had only a little experience with Linux, mainly Ubuntu (on university's
computers) and Raspbian (on my [Raspberry Pi](https://www.raspberrypi.org/)),
I had no strong opinion. After a couple of readings comparing Linux distributions
I concluded that what matters the most was my motivation to learn more and
I decided to go Debian *the mother of many Linux distributions*.

I do not want to go into much details about Debian. First because I am no
expert (and afraid I could be wrong) and second because you will learn way more
by searching on the web by yourself especially on the [official website](https://www.debian.org/).
I think it is nonetheless useful to have broad ideas about its development.
Basically there are [four different kind of Debian releases](https://www.debian.org/releases/)
named after Toy Story's characters:

- **unstable**: always named [Sid](http://pixar.wikia.com/wiki/Sid_Phillips);
- **testing**: currently [Buster](http://pixar.wikia.com/wiki/Buster);  
- **stable**: currently [Stretch](http://pixar.wikia.com/wiki/Buster) (Debian 9);   
- **old stable**: [Jessie](http://pixar.wikia.com/wiki/Jessie), [Wheezy](http://pixar.wikia.com/wiki/Wheezy) and previous.


As explained in [this post by J.A. Watson](http://www.zdnet.com/article/debian-stable-or-debian-testing-which-linux-is-right-for-you/)
all new Debian packages (including new versions of existing packages) first
entered the Debian testing process through the instable release.
After a couple of tests it goes to the testing release where it stays longer.
Depending on the kind of package it may or may not spread to stable and old stable
relases (see https://wiki.debian.org/StableUpdates). Let say that the majority
of new version of package do not spread and are accumulated in the testing.
Actually soft freeze and full freeze to prepare the next stable release
therefore during that time dedicate to solidify the nex release no update
which explain that old version but using testing
A new package or a new version first enter through the unstable release
before testing, I was not aware and decided to install the stable released
and released recently. Block not allowed does not mean people stop developping
make not be included in the stable release so you will not be able to install
using stabel release but you know thta extensively been tested it a choice.

Debian package I said?
Where Debian dev occur?
Let's now consider the Debian packages found on the [Debian mirrors]()
>>>>>>> dev

https://www.debian.org/mirror/list
https://wiki.debian.org/StableUpdates

To illustrate
In the video below I go to a mirror and show you were are store package I did for
Pandoc

Want know more and even be involved... well just go on the website!
https://www.debian.org/devel/

<video width="100%" controls>
 <source src="/assets/myDebianStretch/mirror.webm" type="video/webm">
 Your browser does not support the video tag.
</video>


## My hardware

Unfortunately, I do not have strong knowledge about hardware and the choice that
follows is basically the result of discussions with other non-expert people and
a couple of searches on the web. Several brand of computer have high reputation
and constantly make good computers. One of them is Lenovo and after looking a
on the Internet claiming that Lenovo have a good Linux compatibility and decided
to go for a Lenovo computer. Once I made my mind regarding the brand, I have
spend some time to think about my general expectations: a laptop, medium-size
screen (13"-15"), a good i7 processor, no less than 8Go of RAM, and at least
500Go SSD storage for less than 3000$CAN, warranty included. I finally made
my mind and bought a customized [Lenovo ThinkPad T470p](https://www.notebookcheck.net/Lenovo-ThinkPad-T470p-Core-i7-GeForce-940MX-Laptop-Review.226802.0.html) and below are a couple of details about this
computer I gather using `inxi` (one of the freeware I have installed; if you are
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

The Lenovo ThinkPad T470p was furnished with Windows 10 (note that was reelaes on June 2017) at model
I did not have the choice of the OS, sadly :smile:). Well, I am no Windows
user and do not intend to become one, so I got rid of Windows (I obviously took
a selfie of me using windows first) and installed Debian Stretch, let me now
explain how!


### Get a bootable USB stick

I decided to go with the stable release of Debian so 2017 was Stretch ()on Debian version you need is doubtlessly available on the [official website]( https://www.debian.org/releases/stretch/debian-installer/). I downloaded the
the debian-installer for **amd64** architecture that can be used on bootable
USB stick. I was quite familiar with installing Ubuntu or MacOS with USB stick
but I was unable to remember the command lines required, so I googled
something like "bootable USB stick Debian Stretch" and got an answer
similar to [this conversation on stackexchange](https://unix.stackexchange.com/questions/293969/how-to-make-bootable-debian-usb-on-mac)
(remember that I was on MacOS before).


### A small modification in the BIOS

 > BIOS ([...] an acronym for Basic Input/Output System and also known as the System BIOS, ROM BIOS or PC BIOS) is non-volatile firmware used to perform hardware initialization during the booting process (power-on startup), and to provide runtime services for operating systems and programs. (https://en.wikipedia.org/wiki/BIOS)

Before you can go to your OS you have step and it cannot prevent you from
installing a new OS by default. So I had to change this to be able to install
Debian. On Lenovo ThinkPad when booting your computer the first image you get
is the Lenovo logo and the following message:

> To interrupt normal startup press Enter

I did so and then `F1` to access the BIOS. I opened the *Security* table and
disable the *Secure Boot* option to be able to boot on the USB stick. As I needed
a non-free firmware to use the Wi-Fi I plugged my device on an Ethernet Cable
and seamlessly followed the different steps to successfully install Debian
Stretch. Unfortunately, I did not record all I did but basically is is similar at
what you can found on [that post by ... ](to be added).  was installed with
Gnome and a collection of useful software inluding [LibreOffice](), [Inkscape],
Octave]() and a couple of funny old-school like games (*i.e.* Nibbles, Mines).
Once Debian installed I completed my setup by installing my selection of softwares.




# Setting my Debian Stretch up

<!-- I use a fair number of software (note that some of them I seldom use). But
I know that using the package manager is useful and I only need to script them -->

## Gnome, gnome-tweak-tools and shortcuts

I made three short videos to show you:

1- how to get the gnome version you are using with the GUI;   
2- how to tweak your gnome even more, as you will see I use the [papirus icons]()
and [Vimix dark them]() you can find many good-looking them on []();
3- where to find and add keyboard bindings (for instance to record the screencasts
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

## My list of softwares

Below I provide the gist where I keep track of what I install on my
computer (it is basically a bash script I can use to re-install my computer).
To be able to fully reproduce this you need to change a few lines in the
[sources list](https://wiki.debian.org/SourcesList) as follows:

```
deb http://debian.mirror.rafal.ca/debian/ stretch main contrib non-free
deb-src http://debian.mirror.rafal.ca/debian/ stretch main
deb http://security.debian.org/debian-security stretch/updates main
deb-src http://security.debian.org/debian-security stretch/updates main

# stretch-updates, previously known as 'volatile' https://wiki.debian.org/StableUpdates
deb http://debian.mirror.rafal.ca/debian/ stretch-updates main
deb-src http://debian.mirror.rafal.ca/debian/ stretch-updates main

# R version 3.4.x repositories
deb http://cran.utstat.utoronto.ca/bin/linux/debian stretch-cran34/

# Qgis repositories
deb http://qgis.org/debian stretch main
deb-src http://qgis.org/debian stretch main

# Papirus icons repositories
deb http://ppa.launchpad.net/papirus/papirus/ubuntu xenial main
deb-src http://ppa.launchpad.net/papirus/papirus/ubuntu xenial main
```

To get the wifi working, I needed non-free repo so I first edited the /etc/apt/sources.list as su:
I add 'contrib non-free' after 'main'
https://cran.r-project.org/bin/linux/debian/
To get 3.4.1, I follow the instruction here https://cloud.r-project.org/bin/linux/debian/#supported-branches and add:
deb http://cran.utstat.utoronto.ca/bin/linux/debian stretch-cran34/
in /etc/apt/sources.list then I add the key using apt-key
To get 3.4.1, I follow the instruction here https://cloud.r-project.org/bin/linux/debian/#supported-branches and add:
deb http://cran.utstat.utoronto.ca/bin/linux/debian stretch-cran34/
in /etc/apt/sources.list then I add the key using apt-key
----- Zotero config
http://vk5tu.livejournal.com/54476.html and https://www.zotero.org/support/pdf_fulltext_indexing



If you are a [Homebrew](https://brew.sh/) user, having different repositories
in your source list is like using different taps. For further information about
non-free software you should have a look at the official
website about [unofficial repositories](https://wiki.debian.org/fr/UnofficialRepositories),
[Skype](https://wiki.debian.org/skype) and [Dropbox](https://wiki.debian.org/dropbox).
Furthermore, if you wonder what is the difference between `deb` and `deb-src` go on
[stackexchange](https://unix.stackexchange.com/questions/20504/the-difference-between-deb-versus-deb-src-in-sources-list). Once you are aware about this, have a look at my gist (version
125 when I first shared this post).

<br>

<script src="https://gist.github.com/KevCaz/29536740b9150383a9d543ec1be96103.js"></script>

<br>




Below is a table with link if you want know more about the software I use

**add a table/script**


As you can see for some of them I want a version newer than the one Debian
stable. I use the same strategy:

1. `wget` and save the `.deb` file in the temporary folder `/tmp/`
2. install them with `dpkg` `sudo dpkg -i xxxx.deb`

Pandoc and hugo

<!-- test whether the download work -->






# Issues

Do I have any issue? Yes. I've still have (1) a couple of error messages on startup
and (2) an issue with the back light of my screen! **But** regarding (1) everything
works fine so I do not complain and for (2) I've found a work around :)

## Various messages on startup

As you can see below I have a couple of error messages on log (command line
is `sudo dmesg -l err`):

<img src="/assets/myDebianStretch/errors.png" width="100%"></img>

Well from what I understood nothing too bad. For instance `kvm: disabled by bios`
is more a warning message than an error message. My wi-fiu works great despite
the `firmware: failed to load iwlwifi-8265-26.ucode` message. The ACIP errors
are [triggered because of firmware errors](https://unix.stackexchange.com/questions/92366/acpi-errors-exeptions-why-they-spam-how-to-know-and-fix-it). Well so far everything work well and fix such errors sounds far beyond my
expertise :smile:.

## Back light

After the fresh install, I was able to change the brightness of my screen using
`F5` and `F6` but I am no longer able to do so. I guess at some point my
computer hibernated and this cause the issue. Many posts on line addressing this issue
and I have tried in vain to follow the procedures described to fix this (note that it is likely that I misinterpreted the
procedure). However I have read very thorough [post](https://techoverflow.net/2014/07/27/how-i-solved-my-toshiba-linux-backlight-issues/)
and [bug reports](https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=651741)
reporting the same issue and I have learned a lot. That's something I really
enjoy with Debian: it forces me to understand how things works and even
if my problem is not solved and I cannot yet use `F5` and `F6` I have found
a workaround. I have appended a bash alias in my .zprofile:

    alias mybl='sudo tee /sys/class/backlight/intel_backlight/brightness <<<'

so now if `mybl 500` (mine is between 0 and 1060, that I've leant too :smile:)
my backlight will ne chnaged accordingly!

<br><br>

**See you next post**

<br>
