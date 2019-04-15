---
title: Ubuntu + Windows 7 - dual partition
tags: [Windows, Ubuntu, dual partition, chocolatey, apt-get]
author: [kevin]
reviewer: [marieh]
date: 2018-12-09
draft: false
estime: 7
tweet: My R setup on Debian
output:
  blogdown::html_page:
    fig_width: 3
    dev: svg
---


![](https://img.shields.io/badge/inSileco-UnderReview-ffdd55.svg)


Long story short, I recently had access to a [Dell Studio XPS 8100 ](https://www.dell.com/en-ca/shop/cty/dell-studio-xps-8100-desktop-details-reviews/spd/studio-xps-8100) with [Windows 7](https://en.wikipedia.org/wiki/Windows_7) on it. I was told that the computer was not working well and so was allowed to tweak it. The computer was actually working well so I simply decided to add a partition Ubuntu.

[Ubuntu](https://www.ubuntu.com/) is based on Debian and arguably more beginner-friendly than the latter. Roughly speaking:

```
Ubuntu = Debian Testing + software to simplify its use
```

There are a couple of articles online that are opposing these two Linux distributions, which makes no real sense to me. I prefer the reading of this [article that explains the technical differences](https://wiki.ubuntu.com/Ubuntu/ForDebianDevelopers?action=show&redirect=UbuntuForDebianDevelopers). As I mentioned in a
[previous post](/post/Archived/setUps/goDebianTesting/), I am currently working on Debian with GNOME (3.30) and it is very similar to the latest Ubuntu (18.04, [Bionic Beaver](http://releases.ubuntu.com/18.04/)).





## Cleaning up the Windows 7 partition

I took the opportunity to spend some time on Windows 7. What I did first was a [checkout of the hardware with the `msinfo32` command](https://support.microsoft.com/en-ca/help/300887/how-to-use-system-information-msinfo32-command-line-tool-switches). Then I installed the package manager [chocolatey](https://chocolatey.org/docs/installation). To do so, I used [PowerShell](https://en.wikipedia.org/wiki/PowerShell), version v2.+ was required (see https://chocolatey.org/docs/installation and use `$PSVersionTable.PSVersion` to check out the version available). One line of command completes the installation of [chocolatey](https://chocolatey.org/docs/installation):

```sh
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
```

Before installing Ubuntu, I installed a couple of software to experiment [chocolatey](https://chocolatey.org/docs/installation):

```sh
cinst pandoc R R.Studio imagemagick QGIS
```

Note that this is equivalent to:

```sh
choco install pandoc R R.Studio imagemagick QGIS
```


## Creating a bootable USB stick to install Ubuntu

There are various tutorials online that adress this topic, for instance [this one on tutorials.ubuntu.com](https://tutorials.ubuntu.com/tutorial/tutorial-create-a-usb-stick-on-ubuntu#0). I created a bootable USB stick on my Debian machine but before I [identified the USB device](https://www.tecmint.com/find-usb-device-name-in-linux/):

```sh
$ df -h
Filesystem      Size  Used Avail Use% Mounted on
udev            7.8G     0  7.8G   0% /dev
tmpfs           1.6G   34M  1.6G   3% /run
/dev/nvme0n1p2  922G  226G  650G  26% /
tmpfs           7.8G   53M  7.8G   1% /dev/shm
tmpfs           5.0M  4.0K  5.0M   1% /run/lock
tmpfs           7.8G     0  7.8G   0% /sys/fs/cgroup
/dev/loop1       87M   87M     0 100% /snap/core/5145
/dev/loop3       88M   88M     0 100% /snap/core/5548
/dev/loop5       88M   88M     0 100% /snap/core/5328
/dev/nvme0n1p1  511M  132K  511M   1% /boot/efi
tmpfs           1.6G  9.6M  1.6G   1% /run/user/1000
/dev/sda         15G  809M   14G   6% /media/kevcaz/myusbstick
```

I unmounted the right device: `myusbstick` (last line above) like so:

```sh
$ sudo umount /dev/sda
```

Then I created the bootable key with the [downloaded desktop image](https://www.ubuntu.com/download/desktop/thank-you?country=CA&version=18.04.1&architecture=amd64):

```sh
$ sudo dd bs=4M if=ubuntu-18.04.1-desktop-amd64.iso of=/dev/sda conv=fdatasync
```


## Installing Ubuntu

The final step is straightforward: I plugged the bootable USB stick, rebooted the Dell machine and press F12 to access the BIOS on boot, then booted on the USB device,
and finally followed the instructions. Then on the Ubuntu partition I checkout
the system:

```
$ uname -a
Linux mhb 4.15.0-42-generic #45-Ubuntu SMP Thu Nov 15 19:32:57 UTC 2018 x86_64 x86_64 x86_64 GN
U/Linux
```

During the installation process I was offline and I realized afterwards
that I was not able to get the wifi working. So I plugged the computer on the Ethernet and found out that the Broadcom wireless driver was not properly installed. I solved this issue following this answer on [Stack Exchange]([wifi](https://askubuntu.com/questions/55868/installing-broadcom-wireless-drivers)). Then I installed a couple of freeware:

```sh
sudo apt install calibre inkscape gimp vlc xournal hugo pandoc pandoc-citeproc imagemagick ffmpeg inxi tree curl openssh-server pass
```

Below, I used [inxi](https://www.tecmint.com/inxi-command-to-find-linux-system-information/) to get details about the hardware:

```sh
$ inxi -SMCNDP
System:    Host: mhb Kernel: 4.15.0-42-generic x86_64 bits: 64 Console: tty 1
           Distro: Ubuntu 18.04.1 LTS
Machine:   Device: desktop System: Dell product: Studio XPS 8100 serial: N/A
           Mobo: Dell model: 0G3HR7 v: A00 serial: N/A
           BIOS: Dell v: A05 date: 07/08/2010
CPU:       Quad core Intel Core i5 750 (-MCP-) cache: 8192 KB
           clock speeds: max: 2668 MHz 1: 1496 MHz 2: 1207 MHz 3: 1210 MHz
           4: 1283 MHz
Network:   Card-1: Broadcom and subsidiaries NetLink BCM57780 Gigabit Ethernet PCIe
           driver: tg3
           Card-2: Broadcom and subsidiaries BCM4306 802.11b/g Wireless LAN Controller
           driver: b43-pci-bridge
Drives:    HDD Total Size: 1000.2GB (19.1% used)
           ID-1: /dev/sda model: WDC_WD1001FAES size: 1000.2GB
Partition: ID-1: / size: 550G used: 179G (35%) fs: ext4 dev: /dev/sda5
```

and then I installed R packages and some dependencies required for [sf](https://cran.r-project.org/web/packages/sf/index.html):

```sh
sudo apt-get install xvfb libudunits2-dev libgeos-dev libproj-dev libgdal-dev r-base r-recommended r-base-dev "^r-cran-.*"
sudo Rsript -e "install.packages('sf')"
```

I finally I downloaded
[RStudio](https://www.rstudio.com/products/rstudio/download/#download) and then
I was done.

I still have to write a post about my [Raspberry Pi](https://www.raspberrypi.org/) setup, hopefully I'll do so soon. Also, next time I am given carte blanche, I'll
install a [Linux distribution](https://upload.wikimedia.org/wikipedia/commons/1/1b/Linux_Distribution_Timeline.svg) quite different: Arch, FreeBSD, Fedora, etc. We shall see!
