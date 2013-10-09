dmg2dir
============

 A shell script which extract OS X application from .dmg file.

============

dmg2dir is a shell script, designed for GNU/Linux (and maybe compatible POSIX).
With this, you can extract a .dmg file, alsa know as OS X Disk Image, under GNU/Linux. DMG files are HFS+ disk image.

dmg2dir converts DMG file as a IMG file thanks to dmg2img, and it mounts IMG file into a loop device, then it copies files into the loop device into a directory.
