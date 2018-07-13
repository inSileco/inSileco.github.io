---
title: My MacOS Setup
author: [david]
reviewer:
date: 2018-09-12
tags: [MacOS]
draft: true
tweet: "My MacOS Setup"
estime: 10
relativeurls: true
---

## My MacOS Setup

Inspired by Kevin's [recent post]({{< ref myDebianStretch >}}) on setting up
his new laptop on Debian Stretch, I decided that it was time to reset my
Mac BookPro to factory settings. I bought it after a year in my thesis and
I've grown quite a bit since then in my understanding of programming and
computers in general. That also meant that I had a lot of accumulated junk!

I also figured that I should do so using a bash script so that I could make
this whole process as reproducible as possible for the next time or if I have
to change my laptop for some obscure reason! The goal was to obtain a laptop
configuration with minimal user input to recreate as exact a replica as possible
of the laptop settings I am currently working with.

Full disclosure, I would not have done this without the help of
[Kevin](https://insileco.github.io/about/),
[Steve](https://insileco.github.io/about/) and
[Nicolas](https://insileco.github.io/about/), who gave me great resources and
part of their own code to set up their Mac!

### My laptop

Here is an overview of the laptop I am working with:

```console
/* Laptop info */
sw_vers
  ProductName: Mac OS X
  ProductVersion: 10.13.5
  BuildVersion: 17F77

/* Hardware info */
system_profiler SPHardwareDataType
  Hardware:

    Hardware Overview:

      Model Name: MacBook Pro
      Model Identifier: MacBookPro11,4
      Processor Name: Intel Core i7
      Processor Speed: 2.2 GHz
      Number of Processors: 1
      Total Number of Cores: 4
      L2 Cache (per Core): 256 KB
      L3 Cache: 6 MB
      Memory: 16 GB
      Boot ROM Version: MBP114.0183.B00

      SMC Version (system): 2.29f24
      Serial Number (system): XXXXXXXXXXXX
      Hardware UUID: XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX
```

### Backups

The only thing I did was to back up the files for my thesis that I only have
locally on an external hard drive, which ultimately do not amount to much as
most of my files are backed on the cloud. I use a combination of
[GitHub](https://github.com/),
[MEGASync](https://mega.nz/),
[Dropbox](https://www.dropbox.com/),
[ownCloud](https://owncloud.org/) and
[Google Drive](https://www.google.ca/drive/)
to manage most of my individual and collaborative projects. This means that the
majority of my files can be reaccessed through the web once I've reinstalled
those softwares.


### Reseting to factory settings

Now the first step was to reset my laptop to factory settings. I googled it
and followed most of the instructions found
[here](https://www.macworld.co.uk/how-to/mac/how-reset-mac-factory-settings-3494564/).
I simply did not follow the instructions that targeted time machine, iTunes and
iCloud because I had no intention of reinstalling an image of my laptop or to
sell my laptop to someone else.

In essence, here are the steps I followed (but I still recommendend reading the
detailed documentation
[here](https://www.macworld.co.uk/how-to/mac/how-reset-mac-factory-settings-3494564/)
if you wish to go the same route I did):

1. Make sure that my laptop was connected to the internet (not certain that this
was fully necessary at this point)
2. Restart in recovery mode: `Option + Command + R`
3. Erase hard drive:
  4. `Disk Utility > Continue`
  5. Select main drive, usually `Macintosh HD`
  6. `Erase` button
  7. `Disk Utility > Quit Disk Utility`
8. `Reinstall MacOS` and followed instructions. Note that this took a long while
and that the progress bar and calculation time were very uninformative! I did some
research and found [this](https://www.fonepaw.com/upgrade/macos-install-stuck.html).
Essentially, the progress bar was not progressing but the files were being loaded
anyway. It was just a very long process. I was able to ascertain that things were
indeed progressing by looking at the log file (`Command + L`). Ultimately,
this process took a few hours. Happily, I started doing this at night so I slept
through it!
9. When I woke up, I simply followed the instructions to set up my laptop, such
as my laptop name, passwords, etc.

### Setting up my Mac

What came after was reinstalling every software that I needed to reproduce the
laptop configuration that I wanted. This script allows me to install and all
the softwares I'm using, mostly through [brew](https://brew.sh/),
configure them through the terminal and download all the project data I have
stored in the cloud:

<script src="https://gist.github.com/david-beauchesne/c7b045d07dd213c9144ed64767b70a0a.js"></script>

The script is not perfect. I did have to improve it as I was reinstalling and
reconfiguring my laptop, and I will likely keep improving it through time.
Ultimately, however, I managed to have an almost fully operational and
configured laptop very efficiently.
Building the script and backing up my data did take considerable time, but
I started with a very basic understanding of what it meant to reconfigure a
laptop. I would not say I'm an expert now, far from it, but the whole process
was enlightning and with the script I built I can now easily reset my Mac
or a new one just the way I like it, which was the whole point to begin with!

Enjoy!
