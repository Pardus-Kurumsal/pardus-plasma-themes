ifndef PREFIX
	PREFIX = /usr/share/plasma
endif

all: install

install:
	@echo "Installing Pardus plasma themes"
	mkdir -p $(DESTDIR)$(PREFIX)
	@cp -fr desktoptheme $(DESTDIR)$(PREFIX)
	@cp -fr look-and-feel $(DESTDIR)$(PREFIX)

uninstall:
	@echo "Removing Pardus plasma themes"
	@rm -fr $(DESTDIR)$(PREFIX)/desktoptheme
	@rm -fr $(DESTDIR)$(PREFIX)/look-and-feel

.PHONY: install uninstall
