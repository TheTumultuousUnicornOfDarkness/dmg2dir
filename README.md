dmg2dir
============

 A shell script which extract OS X application from .dmg file.

============

dmg2dir is a shell script, designed for GNU/Linux (and maybe compatible POSIX).

With this, you can extract a .dmg file, alsa know as OS X Disk Image, under GNU/Linux. DMG files are HFS+ disk image.

dmg2dir converts DMG file as a IMG file (depends of dmg2img), and it copies files from mounted IMG file to a directory (called "application directory) and/or it can generate ISO file from mounted IMG file.
It is also possible to try to run application found in application directory with Darling.