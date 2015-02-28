# DMG2DIR

DMG2DIR is a shell script, designed for GNU/Linux (and maybe compatible POSIX), which **extract OS X application** from .dmg file.
With this script, you can extract a .dmg file, alsa know as OS X Disk Image, under GNU/Linux. DMG files are HFS+ disk image.

DMG2DIR converts DMG file as an IMG file (depends of **dmg2img**), then IMG file is mounted (requires **udisks2**) and files, from mounted IMG file, are copied to a directory (called *application directory*).

It can also make an ISO file from mounted IMG file, or else it is possible to try to run application found in application directory by using **Darling**.


## Dependencies

* *hfsplus* module
    * Allow to mount .img file (an HFS+ disk)
    * `modinfo hfsplus`

* dmg2img
   * Convert .dmg file in .img file
   * http://vu1tur.eu.org/tools/

* udisks2
   * Mount .img file
   * http://www.freedesktop.org/wiki/Software/udisks/

* Darling (optionnal)
   * Run the OS X application
   * http://www.darlinghq.org

* cdrtools/cdrkit (optionnal)
   * Make an ISO file (provides command genisoimage)
   * http://cdrecord.org


## Installation

To install DMG2DIR in your system, simply run as root:
```
make install
```
You can change default PREFIX by using:
```
make PREFIX=/absolute_path install
```


## Usage

First, you need to be in group **disk** to be able to mount IMG file.  
Then, from a shell, use command:
```
dmg2dir
```
```
Usage: dmg2dir [OPTIONS] dmg_file.dmg
```
Don't forget to use argument `--help` to see all options available...  
...Or read the man-page: `man dmg2dir`.
