DESTDIR=
PREFIX=/usr/local
bindir=$(PREFIX)/bin
localedir=$(PREFIX)/share/locale
mandir=$(PREFIX)/share/man
MSGFMT := $(shell command -v msgfmt 2> /dev/null)
GZIP := $(shell command -v gzip 2> /dev/null)
INSTALL := $(shell command -v install 2> /dev/null)


all: po man

po:
ifndef MSGFMT
	$(error "'msgfmt' command is missing. Please install gettext.")
endif
	$(MSGFMT) po/fr.po -o po/dmg2dir_fr.mo

man:
ifndef GZIP
	$(error "'gzip' command is missing. Please install gzip.")
endif
	$(GZIP) -f -k -c docs/en.1 > docs/dmg2dir_en.1.gz
	$(GZIP) -f -k -c docs/fr.1 > docs/dmg2dir_fr.1.gz

clean:
	@rm -v po/*.mo
	@rm -v docs/*.1.gz

install: po man
ifndef INSTALL
	$(error "'install' command is missing. Please install coreutils.")
endif
	$(INSTALL) -Dvm755 dmg2dir			$(DESTDIR)$(bindir)/dmg2dir
	$(INSTALL) -Dvm644 po/dmg2dir_fr.mo		$(DESTDIR)$(localedir)/fr/LC_MESSAGES/dmg2dir.mo
	$(INSTALL) -Dvm644 docs/dmg2dir_en.1.gz		$(DESTDIR)$(mandir)/man1/dmg2dir.1.gz
	$(INSTALL) -Dvm644 docs/dmg2dir_fr.1.gz		$(DESTDIR)$(mandir)/fr/man1/dmg2dir.1.gz
	sed -i 's|@TEXTDOMAINDIR@|$(localedir)|g'	$(DESTDIR)$(bindir)/dmg2dir

uninstall:
	@rm -v $(bindir)/dmg2dir
	@rm -v $(localedir)/fr/LC_MESSAGES/dmg2dir.mo
	@rm -v $(mandir)/man1/dmg2dir.1.gz
	@rm -v $(mandir)/fr/man1/dmg2dir.1.gz

.PHONY: po man clean install
