# DMG2DIR

DMG2DIR is a Bash script which can **extract a macOS application** from a DMG file. DMG files are HFS+ disk image.

The DMG file can be extracted to a directory or converted to an ISO file.

## Dependencies

- gettext
  - translate strings
  - https://www.gnu.org/software/gettext

- _hfsplus_ module
  - Allow to mount IMG file (an HFS+ disk image)
  - `modinfo hfsplus`

- dmg2img
  - Convert DMG file to IMG file
  - http://vu1tur.eu.org/tools/

- udisks2
  - Mount IMG file
  - http://www.freedesktop.org/wiki/Software/udisks/

- cdrtools/cdrkit (optionnal)
  - Make an ISO file (provides command genisoimage)
  - http://cdrecord.org

- Darling (optionnal)
  - Run the macOS application
  - http://www.darlinghq.org

## Installation

To install DMG2DIR on your system:

```
# make install
```

You can change default PREFIX by using:

```
# make PREFIX=/absolute_path install
```

## Usage

From a shell, type following command:

```
$ dmg2dir [OPTIONS] dmg_file.dmg
```

Use argument `--help` to see all options, or read the man-page with `man dmg2dir`.
