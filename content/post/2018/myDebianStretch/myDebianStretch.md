---
title: Setting my Debian Stretch up
author: [kevin]
reviewer: [david]
date: 2018-01-21
edits:
  - date: 2018-02-24
    comment: "add a selfie"
  - date: 2018-04-17
    comment: "new gist (won't be updated anymore)"
  - date: 2019-08-09
    comment: "fix links and 2 typos"
tags: [Linux, Debian, Setup]
draft: false
tweet: "Setting my Debian Stretch up"
estime: 14
---



This post details my Debian Stretch setup on my Lenovo ThinkPad T470p.
I got this machine in early August 2017, so I now have almost 6 months worth of experience on
Debian and I thought it was a good time to 1- document the rationale behind my move from
MacOS to Debian 2- explain how I set my computer up and 3- how I rate my appreciation of
working on Debian. Any comments/questions about what follows? Please, feel free
to comment on this post at the end of the post.



## Go Debian

### From MacOS to Linux

I have been a MacOS user for a long time mainly because my father was himself
a MacOS user. I remember back to 2005 how weird it sounded to be a
Mac aficionado compared to how trendy it is nowadays. According to me, Apple
still makes good computers and the money spent on their products if generally worth the performance.
However, given the trend of making computers as thin as possible, a Mac user has less and less
[control over his hardware](https://www.theinquirer.net/inquirer/news/2404318/ifixit-apples-12in-macbook-is-near-impossible-to-repair)
and given the costs associated with having a Mac (adapters, repair costs, etc.),
owning a Mac progressively became much less appealing to me. Even less so since
[suspicions of planned obsolescence](https://www.theguardian.com/technology/2018/jan/08/france-investigates-apple-over-claims-of-planned-obsolescence).
surfaced. Moreover, since I started doing more and more coding, I realized how rarely I was using Apple's
softwares in favor of many freeware. The list of [softwares](https://gist.github.com/KevCaz/e89f5584d4c5c9c92c4e) I
used on my MacOS is actually very similar to the one I use on Debian and that
I present below. It therefore occurred to me that I really had no valid reason
to keep using MacOS and I decided to go Linux. So far, soooooo good :smile:.


### Why Debian?

The choice of Linux distribution is **huge**, as you can see on the dedicated
[wikipedia page](https://en.wikipedia.org/wiki/List_of_Linux_distributions).
As I had only a little experience with Linux, mainly Ubuntu on university
computers and Raspbian on my [Raspberry Pi](https://www.raspberrypi.org/),
I had no strong opinion or inclination to any particular distribution.
After spending some time reading comparisons of Linux distributions
I concluded that what matters the most was my motivation to learn more and
I decided to go Debian, a.k.a. *the mother of many Linux distributions*.

I do not want to go into much details about Debian. First, because I am still very much
a beginner and I do not want to make any glaring mistake and offend anyone! Second because you will learn way more
by searching on the web, especially on the [official website](https://www.debian.org/)
and reading exhaustive manuals such as [Debian Developer's Reference](https://www.debian.org/doc/manuals/developers-reference/)
and [*The Debian Administrator's Handbook*](https://www.debian.org/doc/manuals/debian-handbook/).


It is nonetheless useful to have a broad understanding of Debian's development.
Basically there are [four different kinds of Debian releases](https://www.debian.org/releases/)
named after Toy Story's characters:

- **unstable**: always named [Sid](http://pixar.wikia.com/wiki/Sid_Phillips);
- **testing**: currently [Buster](http://pixar.wikia.com/wiki/Buster);  
- **stable**: currently [Stretch](http://pixar.wikia.com/wiki/Buster) (Debian 9);   
- **old stable**: [Jessie](http://pixar.wikia.com/wiki/Jessie), [Wheezy](http://pixar.wikia.com/wiki/Wheezy) (oldold stable) and previous.


As explained in [this post by J.A. Watson](http://www.zdnet.com/article/debian-stable-or-debian-testing-which-linux-is-right-for-you/),
all new Debian packages, including new versions of existing packages, first
enter the Debian testing process through the unstable release.
After a couple of tests, a new package goes to the testing release where it stays for a longer period.
Depending on the kind of package, it may or may not spread to stable and old stable
releases (see https://wiki.debian.org/StableUpdates). In reality, the majority
of new package versions do not spread further and are instead accumulated as testing releases.

When developing the next stable Debian release, the latest version of packages are
frozen, softly at first and then permanently, meaning that new developments for
the next stable Debian release are gradually stopped. This frozen period is the
time to perform tests and address bugs, necessary developments in order to release
a stable version. Essentially, all this means is that package versions included
in a new stable Debian release are slightly outdated at the time of the stable
version release, which does not preclude packages from being further developed or
render new development inaccessible. One simply has to install the testing version
of Debian to access up-to-date packages.

Debian packages I said? Well they basically are pieces of software for Debian.
Let's say that they are non-random sets of files that Debian can install using
`dpkg -i`. Many packages are available online and you can readily install them
using a single line of command to the package manager `apt-get`. If you are
interested, I invite you to have a look at the [list of
mirrors](https://www.debian.org/mirror/list) forming the main Debian package
repository available online. To illustrate this, in the video below I navigate
to a mirror and show where [pandoc](https://pandoc.org) is stored.

<video width="100%" controls>
 <source src='/post/2018/myDebianStretch/assets/mirror.webm' type="video/webm">
 Your browser does not support the video tag.
</video>


#### Two additional comments

1. There are [different repositories](https://wiki.debian.org/DebianRepository).
For instance, I use a repository to use [icons from the papirus team](https://launchpad.net/~papirus/+archive/ubuntu/papirus).

2. There is an upcoming collaborative development server named [Salsa](https://wiki.debian.org/Salsa)
based on [<i class="fab fa-gitlab" aria-hidden="true"></i>](https://about.gitlab.com/).


<br>

## Installing Debian

### About my hardware

Unfortunately, I do not have strong knowledge of hardware and the choice that
I made was based on discussions with other non-experts and research on the web
Several brands of computer have a high reputation and constantly make good computers.
One of them is [Lenovo](https://www3.lenovo.com/ca/en/), which is supposed to have
a good Linux compatibility. I guess that was enough for me, so there my adventure
with a Lenovo computer began!

Once I chose which brand I would buy, I spent
some time thinking about my general expectations: a laptop, medium-sized
screen (13"-15"), a good i7 processor, no less than 8Go of RAM, and at least
500Go SSD storage for less than 3000$CAN, warranty included. I finally zeroed in on
a customized [Lenovo ThinkPad T470p](https://www.notebookcheck.net/Lenovo-ThinkPad-T470p-Core-i7-GeForce-940MX-Laptop-Review.226802.0.html).
Below are a couple of details about my computer that I can display using the command
`inxi`. Note that `inxi` is one of the freeware I installed to retrieve
information about my hardware using command lines; if you are
interested in free command line tools that return information about your
hardware I recommend [this post on *binarytides*](http://www.binarytides.com/linux-commands-hardware-info/).
The command `inxi -SGCADP` entered in my terminal returns the following:

```
System:    Host: debian Kernel: 4.9.0-5-amd64 x86_64 (64 bit) Desktop: Gnome 3.22.3
           Distro: Debian GNU/Linux 9 (stretch)
CPU:       Quad core Intel Core i7-7820HQ (-HT-MCP-) cache: 8192 KB
           clock speeds: max: 3900 MHz 1: 899 MHz 2: 899 MHz 3: 899 MHz 4: 913 MHz 5: 951 MHz 6: 899 MHz
           7: 899 MHz 8: 1080 MHz
Graphics:  Card-1: Intel Device 591b
           Card-2: NVIDIA GM108M [GeForce 940MX]
           Display Server: X.Org 1.19.2 driver: N/A Resolution: 1920x1080@60.02hz
           GLX Renderer: Mesa DRI Intel Kabylake GT2 GLX Version: 3.0 Mesa 13.0.6
Audio:     Card Intel Device a171 driver: snd_hda_intel Sound: ALSA v: k4.9.0-5-amd64
Drives:    HDD Total Size: 1000.2GB (40.1% used)
           ID-1: /dev/nvme0n1 model: N/A size: 1024.2GB
           ID-2: USB /dev/sda model: Rikiki_USB_3.0 size: 1000.2GB
Partition: ID-1: / size: 922G used: 80G (10%) fs: ext4 dev: /dev/nvme0n1p2
           ID-2: swap-1 size: 17.03GB used: 0.22GB (1%) fs: swap dev: /dev/nvme0n1p3
```


### Hello and good bye Windows 10

The factory settings of my new Lenovo ThinkPad T470p was running on Windows 10 and
I did not have the choice of the OS, sadly :disappointed:. Well, I am no Windows
user and do not intend to become one, so I got rid of Windows ASAP (I obviously took
a selfie 😈) and installed Debian Stretch. Let me now
explain how!

<br>
<center><img alt="me on windows" width="35%" src="/post/2018/myDebianStretch/assets/meonwindows.png"></img></center>
<br>

#### 1- Get a bootable USB stick

I decided to go with the stable release of Debian so, in August, 2017, that meant installing
Stretch (actually released on June 17<sup>th</sup>, 2017). To get the Debian installer, you should
simply know your architecture and visit the [official website](https://www.debian.org/releases/stretch/debian-installer/).
On a recent laptop using an intel processor, it must be **amd64**.
So, I downloaded the debian-installer for **amd64** architecture. I was quite
familiar with installing Ubuntu or MacOS with USB stick
but I was unable to remember the command lines required, so I googled
something like "bootable USB stick Debian Stretch" and got an answer
similar to [this conversation on stackexchange](https://unix.stackexchange.com/questions/293969/how-to-make-bootable-debian-usb-on-mac).
Keep in mind that I was on MacOS before!


#### 2- A small modification in the BIOS

 > BIOS ([...] an acronym for Basic Input/Output System and also known as the System BIOS, ROM BIOS or PC BIOS) is non-volatile firmware used to perform hardware initialization during the booting process (power-on startup), and to provide runtime services for operating systems and programs. (https://en.wikipedia.org/wiki/BIOS)

Before you can install a new OS on your new computer, you may have to change some
settings in the BIOS. In my case, I certainly did! When booting a Lenovo ThinkPad,
the first image that pops up is the Lenovo logo and the following message:

> To interrupt normal startup press Enter

So I pressed `Enter` and then `F1` to access the BIOS. I opened the *Security* table and
disabled the *Secure Boot* option to be able to boot on the USB stick. As I needed
a non-free firmware to use the Wi-Fi I plugged my device on an Ethernet Cable
and seamlessly followed the different steps to successfully install Debian
Stretch. Unfortunately, I did not record everything I did, but it is essentially what is
described in [*The Debian Administrator's Handbook*](https://debian-handbook.info/browse/stable/sect.installation-steps.html).
I chose an installation that includes [Gnome](https://www.gnome.org/)
and a collection of very useful freeware such as [LibreOffice](https://www.libreoffice.org/),
[Inkscape](https://inkscape.org/en/) and [Octave](https://www.gnu.org/software/octave/).

<br>


### Gnome, gnome-tweak-tools and shortcuts

I made three short videos to show you:

1. How to get the gnome version you are using with the GUI;   

2. how to tweak your gnome even more. I personally added the [papirus icons](https://launchpad.net/~papirus/+archive/ubuntu/papirus)
and [Vimix dark them](https://github.com/vinceliuice/vimix-gtk-themes). you can find
many good-looking themes on [gnome-look](https://www.gnome-look.org/);

3. where to find and add keyboard bindings (for instance to record the screencasts
below `ctrl+alt+shift+R`).    

### Gnome version

<video width="100%" controls>
 <source src="/post/2018/myDebianStretch/assets/gnomeVersion.webm" }} type="video/webm">
 Your browser does not support the video tag.
</video>

<br>

### Gnome-Tweak-Tool

<video width="100%" controls>
 <source src="/post/2018/myDebianStretch/assets/gnomeTweak.webm" type="video/webm">
 Your browser does not support the video tag.
</video>

<br>

### Keyboard bindings

<video width="100%" controls>
 <source src="/post/2018/myDebianStretch/assets/shortcuts.webm" type="video/webm">
 Your browser does not support the video tag.
</video>

<br>


## Using Debian

### My list of softwares

I use a fair number of softwares and using a package manager is extremely useful
to install them properly (*e.g.* the package manager takes care of all dependencies)
and to keep track of what is installed. Once Debian was installed, I proceeded to
install my collection of softwares, which is recorded as a list in a bash script
and provided below as a [gist](https://gist.github.com/).
To be able to fully reproduce this you need to change a few lines in the
[sources list](https://wiki.debian.org/SourcesList). I edited `/etc/apt/sources.list`
in the super user mode `su` with the text editor [nano](https://www.nano-editor.org/).
So:

```shell
su
```

to enter the super user mode (require the adequate password) and then

```
nano /etc/apt/sources.list
```

to change the file as follows:

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

The first line indicates that I subscribe to a non-free repository (I needed this
for the Wi-Fi). The six following lines indicate the official repository I
use and the rest of the changes are made so that I subscribe to other repositories
(R, Qgis and papirus icons). Note that if you are a [Homebrew](https://brew.sh/) user,
having different repositories in your source list is like using different taps.
For further information about non-free softwares I installed, have a look at the official
website on [unofficial repositories](https://wiki.debian.org/fr/UnofficialRepositories),
[Skype](https://wiki.debian.org/skype) and [Dropbox](https://wiki.debian.org/dropbox).
Also, if you wonder what is the difference between `deb` and `deb-src`, go on
[stackexchange](https://unix.stackexchange.com/questions/20504/the-difference-between-deb-versus-deb-src-in-sources-list).
Once you are aware of this, have a look at my gist below (also version `138` when
I first shared this post and version `146` after review of this gist
https://gist.github.com/KevCaz/29536740b9150383a9d543ec1be96103 I keep updating).


<br>
<script src="https://gist.github.com/KevCaz/98309a714f6bd3f6ba5ac367425fcb62.js"></script>
<br>

For some of the softwares listed, I do not use `sudo apt-get package` and
I rather use the following strategy:

1. `wget` and save the `.deb` file in the temporary folder `/tmp/`

2. install them with `dpkg` `sudo dpkg -i xxxx.deb`

This allows me to retrieve a newer version of the software than the one available
for the stable release. I do so for Pandoc, Atom and Hugo.


### A few details

For some of the above-mentioned packages, I added a relevant link in the
table below:


{{< softwareskevcaz >}}

<br>

Also, for all the atom packages I install using the `apm` command, the
package documentation is online and the URL is formed as follows:
`https://atom.io/packages/` **+** `pkgname`. For instance, the URL for the
**pigments** package is [https://atom.io/packages/pigments](https://atom.io/packages/pigmnents).


A last note to mention is that I greatly benefited from reading
[this](http://vk5tu.livejournal.com/54476.html) and
[this](https://www.zotero.org/support/pdf_fulltext_indexing) to set Zotero up.


### Issues

Did I face a couple of issues? Of course I did, but I have learned a lot through solving them.
Do I still encounter issues? Yes I do: (1) a couple of error messages on startup
and (2) an issue with the back light of my screen! **BUT** regarding (1), everything
works fine so I do not complain, especially since some of the message I get might be kernel
issues that may be solved when I use a more recent release, and regarding
(2), I found a work around :smile_cat:!

#### Various messages on startup

As you can see below I have a couple of error messages on log (command line
is `sudo dmesg -l err`):

<img src="/post/2018/myDebianStretch/assets/errors.png" width="100%"></img>

Well from what I understood this is nothing too bad. For instance, `kvm: disabled by bios`
is more of a warning message than an error message. My Wi-fi works great despite
the `firmware: failed to load iwlwifi-8265-26.ucode` message. The ACIP errors
are [triggered because of firmware errors](https://unix.stackexchange.com/questions/92366/acpi-errors-exeptions-why-they-spam-how-to-know-and-fix-it).
Well so far everything works well and fixing such errors sounds far beyond my
expertise (for the moment :smile:) and motivation level.

#### Back light

After the fresh install, I was able to change the brightness of my screen using
`F5` and `F6` but I am no longer able to do so. I guess at some point my
computer hibernated and this caused the issue. Many posts address this issue
and I have tried in vain to follow the procedures described to fix this
(note that it is likely that I misinterpreted the procedure). However, I took some
time to read thorough [posts](https://techoverflow.net/2014/07/27/how-i-solved-my-toshiba-linux-backlight-issues/)
and [bug reports](https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=651741)
reporting the same issue and I have learned a lot. That's something I really
enjoy with Debian: it forces me to understand how things works, and even
if my problem is not solved and I can no longer use `F5` and `F6`, I still found
a workaround. I have appended a bash alias in my **.zprofile**:

    alias mybl='sudo tee /sys/class/backlight/intel_backlight/brightness <<<'

so now if `mybl 500` (mine is between 0 and 1060, that I've leaned too!)
my backlight is changed accordingly! **.zprofile** I said? Well, let's keep
this for another post!

<br>


### Future

I am very satisfied with my actual setup. My guess is that I would have been happy
on many Linux distribution. I acknowledge that it requires some time to get used to
Linux and how it works. That being said, the time spent to make your laptop
working is really rewarding and I have already learned tons of tips. I am now
considering switching to Debian testing and reading [*The Debian Administrator's Handbook*](https://www.debian.org/doc/manuals/debian-handbook/)
very carefully!


</br>

### :arrow_right: **SEE YOU NEXT POST!!** :boom:
