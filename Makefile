SHELL=/bin/bash
DESTDIR=
PREFIX=/usr/local
bindir=$(PREFIX)/bin
localedir=$(PREFIX)/share/locale
mandir=$(PREFIX)/share/man
MSGFMT=/usr/bin/msgfmt
GZIP=/usr/bin/gzip
INSTALL=/usr/bin/install

help:
	echo $(INSTALL_PATH)
	echo $(TEXTDOMAINDIR)

all: po man

po:
	$(MSGFMT) -o dmg2dir_fr.mo fr.po

man:
	$(GZIP) -f -k -c docs/en.1 > docs/dmg2dir_en.1.gz
	$(GZIP) -f -k -c docs/fr.1 > docs/dmg2dir_fr.1.gz

clean:
	@rm -v *.mo

install: po man
	$(INSTALL) -Dvm755 dmg2dir		$(DESTDIR)$(bindir)/dmg2dir
	$(INSTALL) -Dvm644 dmg2dir_fr.mo	$(DESTDIR)$(localedir)/fr/LC_MESSAGES/dmg2dir.mo
	$(INSTALL) -Dvm644 dmg2dir_en.1.gz	$(DESTDIR)$(mandir)/man1/dmg2dir.1.gz
	$(INSTALL) -Dvm644 dmg2dir_fr.1.gz	$(DESTDIR)$(mandir)/fr/man1/dmg2dir.1.gz
	sed -i 's|@TEXTDOMAINDIR@|$(localedir)|g' $(DESTDIR)$(bindir)/dmg2dir

uninstall:
	@rm -v $(bindir)/dmg2dir
	@rm -v $(localedir)/fr/LC_MESSAGES/dmg2dir.mo
	@rm -v $(mandir)/man1/dmg2dir.1.gz
	@rm -v $(mandir)/fr/man1/dmg2dir.1.gz


.PHONY: clean install