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



Since almost a year now [I've being spending most of my computer time on Debian]({{< relref "post/myDebianStretch.md" >}}).
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


### My :heart: stopped beating... few hours only!

What do you do when all is installed? Well, you reboot, right? So I did!
On the first the logging page looked the same but once logged in there
was a nightmarish blue screen (you know, the kind of screen Windows is famous for!) :scream:!
My GNOME desktop environment had disappeared :scream:! Here begun a
few hours of total confusion... I have to admit that I felt lost and that
I did not take the time to screenshot or take notes but I have some memories and
what happened and I think I know what I did to solve this mess (again all
on me!).

First at te


really

> systemctl status gdm


even though my logging page was exactly the same... I've tried everything
I knew (not that much!) but I was only able to use either
the Command Line Interface (CLI) or systemctl status gdm3 service


Do remeber why but I actually install

https://unix.stackexchange.com/questions/204387/debian-not-booting-into-gui

It is the

 lightdm

  finally

Well I was not able to recover my set up... Only a blue screen


I read online but an reinstall gnome see

remove lightdm why? I do not understand once done... it worked

echo $DESKTOP_SESSION

https://debian-handbook.info/browse/stable/sect.graphical-desktops.html

https://support.system76.com/articles/desktop-environment/

sudo dpkg-reconfigure gdm3






## What about the new seutp!

### Kernel

As in my first post, I'll use [inxi](https://smxi.org/docs/inxi.htm)

```
inxi -S
```

Previously:


```bash
System:    Host: debian Kernel: 4.9.0-5-amd64 x86_64 (64 bit) Desktop: Gnome 3.22.3
           Distro: Debian GNU/Linux 9 (stretch)
```

Now

```bash
System:    Host: debian Kernel: 4.15.0-3-amd64 x86_64 bits: 64 Desktop: Gnome 3.28.0
           Distro: Debian GNU/Linux buster/sid
```


Actually recently changed:


```bash
System:    Host: debian Kernel: 4.16.0-1-amd64 x86_64 bits: 64 Desktop: Gnome 3.28.1
           Distro: Debian GNU/Linux buster/sid
```

### Source list


https://www.debian.org/doc/manuals/debian-reference/ch02.en.html#_literal_apt_literal_vs_literal_apt_get_literal_literal_apt_cache_literal_vs_literal_aptitude_literal

### Look

Gnome 3.28


### New theme and new cursors and top icon

Top icon

I chose on Gnoome Look https://www.gnome-look.org/p/1148692/

I was not able to gett on GnomeLook and as it was avilable on Gith
Captain America which is on GH  https://github.com/keeferrourke/capitaine-cursors

either clone it or downlod the source and get the lattest rela

I was not sure soI looked up on the Internet

https://askubuntu.com/questions/592478/how-to-install-mouse-cursor

Remember I use Gnome
Gnome tweek option activate and I finally use fully my theme

once I clonded and place me on thisrepo (super user mode required)

```
mkdir /usr/share/icons/CaptaineCursors
cp -r dist/* /usr/share/icons/CaptaineCursors/
```
then reboot and go to gnome tweak to select new cursor

2BEADDED a picture see (picture)

gnome-shell-extension-top-icons-plus
https://askubuntu.com/questions/545741/why-is-shell-theme-disabled-in-gnome-tweak-tool



#### Programming languages


### R

and I remove R [backport](https://backports.debian.org/)
https://www.debian.org/doc/manuals/debian-reference/ch02.en.html#_literal_apt_literal_vs_literal_apt_get_literal_literal_apt_cache_literal_vs_literal_aptitude_literal



### Google chrome
 /etc/apt/sources.list.d/google-chrome.list

```
### THIS FILE IS AUTOMATICALLY CONFIGURED ###
# You may comment out this entry, but any other modifications may be lost.
deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main
```
apt-get update & apt-get upgrade
sudo apt-get install google-chrome-stable




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







lightdm added and remove...
So I remove julia and dowlod from source. Same for Firefox.
So here is what I temporarely decide to add in my `/etc/apt/source.list`
I think it is now time to read acreefyllu Debian handbook!

Bilan, where is my right click hhahahah on my bottom tap bar but... I like it
better that way so I did not find a solution to fiux this.






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

#### PostgreSQL


```
cool : sudo apt-get install qgis
```



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

do a table as of  (as of 04-02-2018) more or less I mi

| Software            | Stretch                  | Testing Stretch            |
|:--------------------|:-------------------------|:---------------------------|
| LibreOffice         |5.2.7.2 20m0(Build:2)     | 6.0.2.1.0 00m0(Build:1)    |
| ImageMagick         |6.9.7-4 Q16 x86_64        | 6.9.9-34 Q16 x86_64        |
| PostgreSQL          |9.6.7                     | 10.3 (Debian 10.3-2)       |
| GIMP                |2.8.18                    | 2.8.22                     |


```
gimp -v
psql --version
```

(convert --version for Image magick)



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

http://www.linuxandubuntu.com/home/debian-9-complete-screenshot-tour

Steve's video

{{< youtube QhEmPScin4Y >}}v

Bryan Lunduke http://lunduke.com/
