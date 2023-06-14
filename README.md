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

From there, select your .iso file that you downloaded earlier and go ahead and flash that to your media of choice. Once it's finished, you can remove the drive and then follow the installation steps given to you. I recommend **not** using the GUI installer as it's a little clunky, but it's not going to break your system if you use it. Personally, I'd opt for the CLI install, it's not filled with text commands or anything like that, it's just a text-based UI that functions similar to a GUI.

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
