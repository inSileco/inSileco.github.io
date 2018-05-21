---
title: Go Debian Testing!
author: [kevin]
reviewer:
date: 2018-05-21
tags: [Linux, Debian]
draft: true
tweet: "Markdown everywhere!"
estime: 15
---



Since almost a year now I've being spending most of my computer time on Debian.
I begun with Debian Stretch and switched to Debian Testing two months ago.
This was another good opportunity to gain skills and I would like to report
about my transition in this post!


## What did really happen?

### The hope of a seamless transition

Last Easter, after a couple of months on Debian Stretch, I felt like the time
to go to Debian Testing had come. I was actually enjoying Debian Stretch and
I was able to manage to get up to date versions of certain software when desired
(detailed in my [previous post]({{< relref "post/myDebianStretch.md" >}})) but
after a couple of online readings I was convinced that being on Testing
was a fairly reasonable step forward that would just make my live easier.

So, [following the instructions on the wiki](https://wiki.debian.org/DebianTesting),
I've changed my `etc/apt/sources.list` file (see also the [Debian handbook](https://debian-handbook.info/browse/stable/apt.html#id-1.9.10.8)
for more details):

```
# main repo
deb http://debian.mirror.rafal.ca/debian testing main contrib non-free
deb-src http://debian.mirror.rafal.ca/debian testing main contrib non-free

deb http://security.debian.org/debian-security testing/updates main contrib non-free
deb-src http://security.debian.org/debian-security testing/updates main contrib non-free

# testing-updates, previously known as 'volatile'
deb http://debian.mirror.rafal.ca/debian/ testing-updates main contrib non-free
deb-src http://debian.mirror.rafal.ca/debian/ testing-updates main contrib non-free
```

I then entered `sudo apt-get update && sudo apt-get upgrade` in a
bash terminal and got:

<img src="assets/updeb0.png#center" style="width:80%"></img>


Many, many upgrades! They were expected and I therefore proceeded and entered
`Y` which triggered the downloading of the required files:

<img src = "assets/updeb1.png#center" style="width:80%"></img>

A few messages popped up to warn me about major changes during the
installation process, for instance for PostgreSQL:

<img src = "assets/updeb2.png#center" style="width:80%"></img>


and back-up manager:

<img src = "assets/updeb3.png#center" style="width:80%"></img>



### A (minor) delusion

This first 1524 upgrades took 29 minutes (not bad at all) and I thought it
would be that easy! But after some time on Debian and the subsequent
changes I've made, migrating to Testing required further steps and I guess
it (at least partially) explains the number of [packages kept back](https://askubuntu.com/questions/601/the-following-packages-have-been-kept-back-why-and-how-do-i-solve-it)
I had.

To install the rest of the packages, I cautiously installed them using
`sudo apt-get install`:

<img src = "assets/updeb4.png#center" style="width:80%"></img>

If I recall correctly, I proceeded as follows:

1. `sudo apt-get install firstPackagekeptBack`
2. Do some packages remain kept back?
3. if yes go back to 1

I don't think this is the best approach as I could have either copy-paste
the full package list and install them all at once or use [`dist-upgrade`](https://askubuntu.com/questions/81585/what-is-dist-upgrade-and-why-does-it-upgrade-more-than-upgrade),
but it worked:

<img src = "assets/updeb5.png#center" style="width:80%"></img>

"Yeah!! all right, all done, all good!", that's what I was thinking at that
stage.


### My :heart: stopped beating... for a few hours only!

What do you do when all is installed? Well, you reboot, right? So I did!
The logging page looked the same but once logged in there
was a nightmarish blue screen (you know, the kind of screen Windows is famous for!) :scream:!
My GNOME desktop environment had disappeared :scream:! Here begun a
few hours of confusion... I actually felt a bit lost that's why I did not
take screenshot or detailed notes about what's was happening but I recall
more or less what I did to solve this mess (a mess I am responsible for).

First of all I learned very helpful shortcuts that enable to switch from
the Desktop environment to the Command Line Interface (CLI): `ctrl + atl + f2`
and conversely `ctrl + atl + f3` (even more funny I was not able to use it
first because somehow I turned `FnLock` on). So, even though I was not able
to use GNOME I was able to see what was happening using the CLI. And
so I searched on the internet (I had another computer) for a solution
and there I leanr that I could check the status of the [display mangers](https://wiki.debian.org/DisplayManager)
using `systemctl` for instance for the Gnome Display Manager (gdm):

```
systemctl status gdm
```

(see https://unix.stackexchange.com/questions/204387/debian-not-booting-into-gui)
and then I realize there was something wrong with gnome. So first I decided
to install another display manager, I chose [lightdm](https://wiki.debian.org/LightDM)
and it worked well. I was relieved that everything was working well (no
more weird blue screen) but I really wanted my GNOME back and so I thought
that I needed to reinstall it:

```
sudo apt-get install --reinstall gnome3
```

The reinstallation went Ok but it was not working... until I removed lightdm,
that I cannot explain... But in the end GNOME was back, the update
was completed! Given what I went through I think it is worth spending
some time learning about the different graphical desktops Debian offers,
I recommend the reading of the [Debian Handbook](https://debian-handbook.info/browse/stable/sect.graphical-desktops.html),
and this article for [Ubuntu useres](https://support.system76.com/articles/desktop-environment/)
which interestingly assert that:

> In Ubuntu 16.04, make sure to choose lightdm as the display manager
> when prompted. Choosing gdm, sddm, or another, will break the installation.   

By the way note that `echo $DESKTOP_SESSION` indicates the desktop
environment you are currently using and if you are eager to change the
use display manager you have to reconfigure a display manager package, *e.g.*
`dpkg-reconfigure gdm3` (in su mode).





## What about my new setup?


### Kernel and GNOME version

As in my first post, I use [inxi](https://smxi.org/docs/inxi.htm) tpo
provide some details regarding my setup:

```
inxi -S
```

Previously the command returned:


```bash
System:    Host: debian Kernel: 4.9.0-5-amd64 x86_64 (64 bit) Desktop: Gnome 3.22.3
           Distro: Debian GNU/Linux 9 (stretch)
```

Now:

```bash
System:    Host: debian Kernel: 4.15.0-3-amd64 x86_64 bits: 64 Desktop: Gnome 3.28.0
           Distro: Debian GNU/Linux buster/sid
```


Actually, there was a recent kernel update, currently I am on:


```bash
System:    Host: debian Kernel: 4.16.0-1-amd64 x86_64 bits: 64 Desktop: Gnome 3.28.1
           Distro: Debian GNU/Linux buster/sid
```



### New theme and new cursors and top icon

I keep using the same theme that I used on [my Debian Stretch setup]({{< relref "post/myDebianStretch.md#Gnome,gnome-tweak-toolsandshortcuts" >}}) but I
further customized it:

1. I keep using the [Vimix theme](https://github.com/vinceliuice/vimix-gtk-themes) and I added the [user theme that was disabled](https://askubuntu.com/questions/545741/why-is-shell-theme-disabled-in-gnome-tweak-tool),
1. I add a shell extension: Topicons Plus (https://extensions.gnome.org/extension/1031/topicons/)
3. I chose a new set of cursors: [Capitaine Cursors](https://www.gnome-look.org/p/1148692/)

Regarding 1 and 2, below is my setup on GNOME tweak:

<img src = "assets/themes.png#center" style="width:80%"></img>

<img src = "assets/activated.png#center" style="width:80%"></img>


Regarding 3, it took me few extra steps as I was not able to get the cursor
directly on GNOME-Look:

1. I clone the [<i class="fa fa-github" aria-hidden="true"></i> repo](https://github.com/keeferrourke/capitaine-cursors)

2. I double check on the Internet how to proceeded (see
[<i class="fa fa-external-link" aria-hidden="true"></i>](https://askubuntu.com/questions/592478/how-to-install-mouse-cursor))

3. Once I clone and the repo and set the current directory to my cloned repo:

```
mkdir /usr/share/icons/CaptaineCursors
cp -r dist/* /usr/share/icons/CaptaineCursors/
```

4. I then reboot and go to gnome tweak to select new cursor in the list
of cursors


This is the current look (I use one of the default wallpaper)


<img src = "assets/look.png#center" style="width:90%"></img>


I like it that way!



### Software - a few notes

#### Newer version

do a table as of  (as of 04-02-2018) more or less I mi

| Software            | Command line         | Stretch                  | Testing (April 2018)       |
|:--------------------|:---------------------|:-------------------------|:---------------------------|
| LibreOffice         |libreoffice --version |5.2.7.2 20m0(Build:2)     | 6.0.2.1.0 00m0(Build:1)    |
| ImageMagick         |convert --version     |6.9.7-4 Q16 x86_64        | 6.9.9-34 Q16 x86_64        |
| PostgreSQL          |psql --version        |9.6.7                     | 10.3 (Debian 10.3-2)       |
| GIMP                |gimp --version        |2.8.18                    | 2.8.22                     |






### R

and I remove R [backport](https://backports.debian.org/)
https://www.debian.org/doc/manuals/debian-reference/ch02.en.html#_literal_apt_literal_vs_literal_apt_get_literal_literal_apt_cache_literal_vs_literal_aptitude_literal





### Zotero

```bash
❯ zotero -v
xulrunner not found, trying firefox instead.
Zotero Zotero 4.0.29.16, Copyright (c) 2006-2016 Contributors
```

```bash
❯ zotero -v
xulrunner not found, trying firefox instead.
Zotero Zotero 4.0.29.16, Copyright (c) 2006-2016 Contributors
```

Same version. Not sirptrinsing developement on version 5 that I was to install
the version 5, and so I did


```bash
❯ zotero --version
Zotero Zotero 5.0.44, Copyright (c) 2006-2018 Contributors
```

https://forums.zotero.org/discussion/68453/install-zotero-5-0-on-ubuntu



### Firefox and Thunderbird

Same discussion to

 Thunderbird 52.7.0

https://www.debian.org/doc/manuals/debian-reference/ch02.en.html#_tracking_literal_testing_literal_with_some_packages_from_literal_unstable_literal


```bash
❯ firefox -v
Mozilla Firefox 52.7.3
```


https://www.addictivetips.com/ubuntu-linux-tips/get-firefox-quantum-on-debian-stable/

recently (May 11) 52.8.0 still question on Debian best strategy to include 60.XX there are otrher optopn like snal




### Snap

```bash
❯ snap --version
snap    2.32.5
snapd   2.32.5
series  16
debian
kernel  4.15.0-3-amd64
```

https://docs.snapcraft.io/snaps/san











#### Programming Langage

#### Julia

```
julia --version
```

berfore / after

```
julia version 0.4.7
```


julia is already the newest version (0.4.7-6+b3).
well 01-04-2018 no...



#### Sage

sage -v
SageMath version 7.4, Release Date: 2016-10-18

```
❯ sudo apt-get install sagemath                                                                                                   4]
Reading package lists... Done
Building dependency tree
Reading state information... Done
Some packages could not be installed. This may mean that you have
requested an impossible situation or if you are using the unstable
distribution that some required packages have not yet been created
or been moved out of Incoming.
The following information may help to resolve the situation:

The following packages have unmet dependencies:
 sagemath : Depends: ecl (>= 15.3.7+dfsg1-2) but it is not going to be installed
            Depends: libflint-2.5.2 but it is not going to be installed
            Depends: libflint-arb1 but it is not going to be installed
            Depends: libgsl2 but it is not going to be installed
            Depends: liblinbox-1.4.2-0 but it is not going to be installed
```

apt-cache policy sagemath
sagemath:
  Installed: (none)
  Candidate: 7.4-9
  Version table:
     7.4-9 500
        500 http://ftp.debian.org/debian stable/main amd64 Packages

well sage disappeared!



### Recap






### Update myGist

Well I may not have got everything right yet. That being said I really am happy
about the progresses I made and love being in Debian stable. Set up os evolving
and new version. I will doutlessly post when I move a step forward.
I lose sage because... but install
Next step cherry picking some cherry picking as mentioned in the Manual
Well I'll likely post about it

no more backport
hugo -> sudo apt not on GH
git config --global color.diff auto -> in a dotfiles I keep on GH

### Gist

<script src="https://gist.github.com/KevCaz/29536740b9150383a9d543ec1be96103.js"></script>

### New tricks

#### Debian vs Ubuntu

I wonder what was the difference between Ubuntu and Debian

https://wiki.ubuntu.com/Ubuntu/ForDebianDevelopers?action=show&redirect=UbuntuForDebianDevelopers

27th April 2018 new Ubuntu https://insights.ubuntu.com/2018/04/26/ubuntu-18-04-lts-optimised-for-security-multi-cloud-containers-ai


####
gsettings get org.gnome.settings-daemon.plugins.media-keys max-screencast-length
gsettings set org.gnome.settings-daemon.plugins.media-keys max-screencast-length 45


#### apt vs apt-get

understanding apt / apt-get
https://askubuntu.com/questions/445384/what-is-the-difference-between-apt-and-apt-get
+ see debian manual


#### Other

https://wiki.debian.org/DebianRepository/Unofficial


```bash
❯ cat /etc/*-release
PRETTY_NAME="Debian GNU/Linux buster/sid"
NAME="Debian GNU/Linux"
ID=debian
HOME_URL="https://www.debian.org/"
SUPPORT_URL="https://www.debian.org/support"
BUG_REPORT_URL="https://bugs.debian.org/"
```




The following packages were automatically installed and are no longer required:
  linux-headers-4.15.0-2-amd64 linux-headers-4.15.0-2-common linux-image-4.15.0-2-amd64
Use 'sudo apt autoremove' to remove them.
0 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.



## Nice new resources


https://www.debian.org/doc/manuals/debian-reference/ch02.en.html#_literal_apt_literal_vs_literal_apt_get_literal_literal_apt_cache_literal_vs_literal_aptitude_literal


http://www.linuxandubuntu.com/home/debian-9-complete-screenshot-tour

Steve's video

{{< youtube QhEmPScin4Y >}}v

Bryan Lunduke http://lunduke.com/
