SHELL=/bin/bash
PREFIX=/usr/local
bindir=$(PREFIX)/bin
localedir=$(PREFIX)/share/locale
MSGFMT=/usr/bin/msgfmt
INSTALL=/usr/bin/install

help:
	echo $(INSTALL_PATH)
	echo $(TEXTDOMAINDIR)

all: po

po:
	$(MSGFMT) -o dmg2dir_fr.mo fr.po

clean:
	@rm -v *.mo

install: po
	$(INSTALL) -Dvm755 dmg2dir		$(bindir)/dmg2dir
	$(INSTALL) -Dvm644 dmg2dir_fr.mo	$(localedir)/fr/LC_MESSAGES/dmg2dir.mo
	sed -i 's|@TEXTDOMAINDIR@|$(localedir)|g' $(bindir)/dmg2dir

uninstall:
	@rm -v $(bindir)/dmg2dir
	@rm -v $(localedir)/fr/LC_MESSAGES/dmg2dir.mo


.PHONY: clean install