---
title: Go Debian Testing!
author: [kevin]
reviewer:
date: 2018-05-21
tags: [Linux, Debian]
draft: false
tweet: "Markdown everywhere!"
estime: 15
---


 ![](https://img.shields.io/badge/inSileco-UnderReview-ffdd55.svg)

Since almost a year now I've being spending most of my computer time on Debian.
I begun with Debian Stretch and switched to Debian Testing two months ago.
This was another good opportunity to gain skills and I'd like to report
about my transition in this post.


## What did really happen?

### The hope of a seamless transition

Last Easter, after a couple of months on Debian Stretch, I felt like the time
had come for me to go Debian Testing. I was actually enjoying Debian Stretch and
I was able to manage to get up-to-date versions of certain software when desired
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
would be that easy! But after some time on Debian and given the subsequent
changes I've made, migrating to Testing required further steps as I had a
couple of [packages kept back](https://askubuntu.com/questions/601/the-following-packages-have-been-kept-back-why-and-how-do-i-solve-it).

To install the rest of the packages, I cautiously installed them using
`sudo apt-get install`:

<img src = "assets/updeb4.png#center" style="width:80%"></img>

If I recall correctly, I proceeded as follows:

1. `sudo apt-get install firstPackagekeptBack`
2. Do some packages remain kept back?
3. if yes go back to 1

I don't think this is the best approach as I could have either copy-pasted
the full package list to install them all at once or use the  [`dist-upgrade`](https://askubuntu.com/questions/81585/what-is-dist-upgrade-and-why-does-it-upgrade-more-than-upgrade) command instead. But it worked:

<img src = "assets/updeb5.png#center" style="width:80%"></img>

"Yeah!! all right, all done, all good!:fire:" I was thinking at that
stage.


### My :heart: stopped beating... for a few hours only!

What do you do when all is installed? Well, you reboot, right? And did I!
The logging page actually looked the same but once logged in there
was a nightmarish blue screen (you know, the kind of screen Windows is famous for!) :scream:!
My GNOME desktop environment had disappeared :scream:! Here begun a
few hours of confusion... I actually felt a bit lost that's why I did not
take any screenshot or notes about what's was happening but I recall
more or less what I did to solve this mess (a mess that I was responsible for).

First of all I learned very helpful shortcuts that allow the user to switch from
his desktop environment to the Command Line Interface (CLI): `ctrl + atl + f2`
and conversely `ctrl + atl + f3`. Even though I was not able
to use GNOME I was able to see what was happening using the CLI.
I searched on the internet (I had another computer) for a solution
and there I learned how to check the status of the [display mangers](https://wiki.debian.org/DisplayManager), for instance, for the Gnome Display Manager (gdm):

```
❯ systemctl status gdm
```

This is how to realize there was something wrong with GNOME (see https://unix.stackexchange.com/questions/204387/debian-not-booting-into-gui).
At that point, I decided to install another display manager (I do not
understand why :smile:), I chose [lightdm](https://wiki.debian.org/LightDM).
It was working just fine and I relieved that everything was working well (no
more weird blue screen) but I really wanted my GNOME back and I reinstalled it:

```
❯ sudo apt-get install --reinstall gnome3
```

The re-installation went well but it was still not working... until I
removed lightdm, that I cannot explain... But in the end GNOME was back, the update
was completed!

Given what I went through, I think it is worth spending
some time reading about the different graphical desktops Debian offers,
I recommend the reading of the [section of the Debian Handbook on the topic](https://debian-handbook.info/browse/stable/sect.graphical-desktops.html),
and this article for [Ubuntu useres](https://support.system76.com/articles/desktop-environment/)
that interestingly asserts:

> In Ubuntu 16.04, make sure to choose lightdm as the display manager
> when prompted. Choosing gdm, sddm, or another, will break the installation.   

By the way, note that `echo $DESKTOP_SESSION` indicates the desktop
environment you are currently working withg and if you are eager to change the
use display manager you have to reconfigure a display manager package, *e.g.*
`dpkg-reconfigure gdm3` (in su mode).





## What about my new setup?


### Kernel and GNOME version

As in my first post, I use [inxi](https://smxi.org/docs/inxi.htm) below:

```
❯ inxi -S
```

Previously, the command returned:


```bash
System:    Host: debian Kernel: 4.9.0-5-amd64 x86_64 (64 bit) Desktop: Gnome 3.22.3
           Distro: Debian GNU/Linux 9 (stretch)
```

Now I get:

```bash
System:    Host: debian Kernel: 4.15.0-3-amd64 x86_64 bits: 64 Desktop: Gnome 3.28.0
           Distro: Debian GNU/Linux buster/sid
```


Actually, there was a recent kernel update, so currently I am on:


```bash
System:    Host: debian Kernel: 4.16.0-1-amd64 x86_64 bits: 64 Desktop: Gnome 3.28.1
           Distro: Debian GNU/Linux buster/sid
```



### New theme and new cursors and top icon

I keep using the same theme that I used on [my Debian Stretch setup]({{< relref "post/myDebianStretch.md#Gnome,gnome-tweak-toolsandshortcuts" >}}) but I
further customized it:

1. I chose the [Vimix theme](https://github.com/vinceliuice/vimix-gtk-themes) and I added the [user theme that was disabled](https://askubuntu.com/questions/545741/why-is-shell-theme-disabled-in-gnome-tweak-tool),
1. I added a shell extension: [Topicons Plus](https://extensions.gnome.org/extension/1031/topicons/)
3. I chose a new set of cursors: [Capitaine Cursors](https://www.gnome-look.org/p/1148692/)

Regarding 1 and 2, find below my setup on GNOME tweak:

<img src = "assets/themes.png#center" style="width:80%"></img>

<img src = "assets/activated.png#center" style="width:80%"></img>


Regarding 3, it took me few extra steps as I was not able to retrieve the cursor
directly from GNOME-Look:

1. I cloned the [<i class="fa fa-github" aria-hidden="true"></i> repo](https://github.com/keeferrourke/capitaine-cursors)

2. I double checked on the Internet how to proceed (see
[<i class="fa fa-external-link" aria-hidden="true"></i>](https://askubuntu.com/questions/592478/how-to-install-mouse-cursor))

3. Once the repo cloned, I used the following command lines:

```
❯ cd path/to/the/cloned/repo
❯ mkdir /usr/share/icons/CaptaineCursors
❯ cp -r dist/* /usr/share/icons/CaptaineCursors/
```

4. Then I rebooted

5. I selected then new cursor in the list of cursors on GNOME tweak.


The image below show what my Desktop environment currently looks like (I use one of the default wallpaper)


<img src = "assets/look.png#center" style="width:90%"></img>


I like it that way!



### Software - a few notes

#### Newer versions - four examples


| Software            | Command line         | Stretch                  | Testing (April 2018)       |
|:--------------------|:---------------------|:-------------------------|:---------------------------|
| LibreOffice         |libreoffice --version |5.2.7.2 20m0(Build:2)     | 6.0.2.1.0 00m0(Build:1)    |
| ImageMagick         |convert --version     |6.9.7-4 Q16 x86_64        | 6.9.9-34 Q16 x86_64        |
| PostgreSQL          |psql --version        |9.6.7                     | 10.3 (Debian 10.3-2)       |
| GIMP                |gimp --version        |2.8.18                    | 2.8.22                     |

#### About Firefox

Well Debian Testing do not yet offer Firefox 60-X via aptitude and there
are actually ongoing discussions about this on the Debian developer mailing
list. While I am still using Firefox 52-X and am satisfied with it
I wanted to install the last version. As
[suggested by the Debian wiki](https://wiki.debian.org/Firefox), I
first installed the package manager [snap](https://docs.snapcraft.io/snaps/):

```bash
❯ snap --version
snap    2.32.5
snapd   2.32.5
series  16
debian
kernel  4.15.0-3-amd64
```

and then installed Firefox via snap:

```bash
❯ snap install firefox
```


#### About R

Being on Debian Testing means the [backport](https://backports.debian.org/)
I previously used was no longer required! So I dropped it! R 3.4.4 is
the last R version available via aptitude and I am patiently waiting for 3.5.0.
If you search about this, you'll find [active discussions about this migration](https://www.mail-archive.com/r-sig-debian@r-project.org/msg02777.html).


#### About Sage

I used to have [Sage](http://www.sagemath.org/) installed:

```bash
❯ sage -v
SageMath version 7.4, Release Date: 2016-10-18
```

Unfortunately, recent versions are not available for Testing (see [Debian wiki](https://wiki.debian.org/DebianScience/Sage)). Even though I subscribed
to the stable repositories (sources):


```bash
❯ apt-cache policy sagemath
sagemath:
  Installed: (none)
  Candidate: 7.4-9
  Version table:
     7.4-9 500
        500 http://ftp.debian.org/debian stable/main amd64 Packages
```

I am not able to install Sage:


```
❯ sudo apt-get install sagemath      
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
            ...
            Recommends: texlive-latex-base but it is not going to be installed
E: Unable to correct problems, you have held broken packages.
```

:cry: Well I guess my option is to cherry pick form Unstable... I'll let you know
if I do such move.




### Useful resources

#### Answers to questions I had in my mind  

I had questions, I've found answers, let me share:

- What's the difference between `atp` and `àpt-get`? The Debian Handbook give a clear [answer
about it](https://www.debian.org/doc/manuals/debian-reference/ch02.en.html#_literal_apt_literal_vs_literal_apt_get_literal_literal_apt_cache_literal_vs_literal_aptitude_literal
).

- What are the difference between Debian and Ubuntu? Here is some
[interesting material related to this](https://wiki.ubuntu.com/Ubuntu/ForDebianDevelopers?action=show&redirect=UbuntuForDebianDevelopers).

- How to change the length of a screencast? I've found this [answer by Antoine Schellenberger](http://antoine-schellenberger.com/linux/2014/11/03/change-default-screencast-duration-in-gnome-3.html):

```bash
❯ settings get org.gnome.settings-daemon.plugins.media-keys max-screencast-length 60
```

#### Miscellaneous

- I've updated [my Gist `installDebian.sh`](https://gist.github.com/KevCaz/29536740b9150383a9d543ec1be96103)
- I've come across that nice screenshot tour for Debian Stretch http://www.linuxandubuntu.com/home/debian-9-complete-screenshot-tour
- [Steve]({{< relref "about.md">}}) brought that great talk by [Bryan Lunduke](http://lunduke.com/)
to my attention, I love it:

{{< youtube TVHcdgrqbHE >}}



<br><br>

I like being on Testing and I guess I'll stay on it for a while. The
natural next step for me is to be able to efficiently cherry pick
package from the Unstable. It sounds like pretty straightforward
according to the Debian Handbook by I'd like to read a bit more
before any new transition! I'll keep you blogposted!

<br>

#### **THE END** :dizzy_face:
