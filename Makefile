prefix = /usr
libdir = $(prefix)/lib
datarootdir = $(prefix)/share
datadir = $(datarootdir)
moduledir = $(datadir)/eselect/modules

install: compiler-shadow.eselect
	install -d "$(DESTDIR)$(moduledir)"
	rm -f $<.tmp
	libdir="$(libdir)"; sed -e "s@^\(MASQ_LIBDIR=\).*\$$@\1$${libdir##*/}@" $< > $<.tmp
	install -m0644 $<.tmp "$(DESTDIR)$(moduledir)/$<"
	rm -f $<.tmp

.PHONY: install
