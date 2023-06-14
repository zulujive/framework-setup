# Debian Framework Setup
Are you confused about installing Debian on your Framework (or even another x86 system)? Are you tired of scrolling through Debian's IQ test of a downloads page? Do you just want to install it like a normal person? If so, this is the tutorial for you.

## WHERE DO I DOWNLOAD DEBIAN FOR REAL?
Glad you asked! Unlike virtually every other distro, Debian does not provide the ideal images for you to setup. We'll make it easy for you, navigate to this link:

[Debian Light Installer Download](https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/)

It'll take you to the CD/DVD downloads page. Don't be fooled by the title, this is the page that you should be downloading from as it includes a wonderful installer and works similar to how you'd install distros like Ubuntu and PopOS. Scroll down all the way to the bottom, this is where you'll find the files that you can download.
Go ahead and download this file:
```
debian-12.x.x-amd64-netinst.iso
```
It should be about 700mb, the small size is because the installer will download everything else as you install. Make sure you'll have access to a **wired** internet connection as WiFi may not work. If you don't have access to wired internet, you can simply go to this link and scroll all the way to the bottom:

[Debian Offline Installer Download](https://cdimage.debian.org/debian-cd/current/amd64/iso-dvd/)

and download this file:
```
debian-12.x.x-amd64-DVD-1.iso
```
It's a larger download, but it doesn't require an internet connection for the installation.

Congratulations, you are now the top 1% of users who can actually find the downloads page!

## Making installation media
There are several methods of going about this. Personally, I find Raspberry Pi Imager to be the most helpful as it's a light install and super easy to use. You can also use Balena Etcher, though it's a little more clunky and bloated compared to RPi Imager.
You can get RPi Imager from flathub:
https://flathub.org/apps/org.raspberrypi.rpi-imager

Now, simply get any sort of media that you can flash to. You can use a USB flash drive, an external hard disk, even a CD or DVD if you'd like. Just remember that any existing data will be deleted as part of the flashing process, you don't have to format the drive before flashing, just make sure it can at least interface with your system.

From there, select your .iso file that you downloaded earlier and go ahead and flash that to your media of choice. Once it's finished, you can remove the drive and then follow the installation steps given to you after booting the drive. 

## Tips
I recommend **not** using the GUI installer as it's a little clunky, but it's not going to break your system if you use it. Personally, I'd opt for the CLI install, it's not filled with text commands or anything like that, it's just a text-based UI that functions similar to a GUI.

If you're deciding which desktop environment to use, it mostly comes down to either KDE or Gnome. Personally, I opted for Gnome as the trackpad shortcuts are phenomenal and it has a clean, modern UI. KDE is alright, especially if you're coming from Windows. I'd say the biggest advantage is that it has some of the most configuration options of any desktop environment, but it can get messy and overwhelming. From experience, Gnome is hands down more efficient to use and doesn't flood your system with too many default apps like KDE. On top of that, it departs from the inefficiency of having a start menu and a tiny toolbar by replacing it with a MacOS-style toolbar and full-screen app menu similar to Mac's Launchpad. Gnome has taught me that sometimes, you have to put simplicity over configurability to prevent a clunky and fragmented interface.

Once you've installed Debian, pat yourself on the back and go ahead and use my install script if you have a Framework 13 laptop (not sure how well it'll support the Framework 16).

## Using
Simply type this command into your terminal:
```
wget -O - https://raw.githubusercontent.com/zulujive/framework-setup/pages/setup.sh | sudo bash
```
Restart after completing and set fingerprint to use in terminal.

## Installs:
- Git
- OpenJDK
- ZSH
- Various media and fingerprint drivers

## Quick question: why is the easy Debian download so hard to find?
There are various reasons for this, but it largely comes down to how the Debian team is structured. Unlike other distros, Debian is produced completely by a group of volunteers. This means that teams will often operate independently from each other, meaning that the team responsible for publishing Debian's official images is different from the team responsible for creating a user-friendly installer. The issue is that Debian isn't necessarily intended to be used for desktop users and largely serves as a simple bedrock distro for other more user-friendly distros (Ubuntu, Raspbian, etc.). This leads to you, the user, digging through mounds of files just to find the useful one.

I created this tool because if I had access to something like this when installing Debian, it would've saved me a bunch of headache and frustration. Installing Debian is not rocket science if you're given the right links, but it's definitely nearly impossible for a novice user trying to look for the right download straight from Google. I hope I helped you in any way by making this available, Debian is by far one of the best distros for a Framework laptop.
