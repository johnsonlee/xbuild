NATIVE_BUILD=1

include ../Makefile.include

LIBNAME = glib
LIBVER  = 2.28.8
LIBURL  = http://ftp.gnome.org/pub/GNOME/sources/glib/2.28
LIBSRC  = $(LIBNAME)-$(LIBVER)
LIBFILE = $(LIBSRC).tar.xz

PCFILE = $(PREFIX)/lib/pkgconfig/$(LIBNAME)-2.0.pc

all: .install-$(PLATFORM)

$(TARBALLS_LOCATION)/$(LIBFILE):
	@echo "Downloading from $(LIBURL)/$(LIBFILE)"
	@$(WGET) $(WGET_FLAGS) $(LIBURL)/$(LIBFILE)

$(PLATFORM): $(TARBALLS_LOCATION)/$(LIBFILE)
	@rm -rf $(PLATFORM)/*; mkdir -p $(PLATFORM)
	@$(TAR) $(TAR_FLAGS) $(TARBALLS_LOCATION)/$(LIBFILE)
	@cd $(PLATFORM); ./configure --prefix=$(PREFIX) --with-libiconv=gnu

$(PCFILE): $(PLATFORM)
	@$(MAKE) -C $(PLATFORM)

.install-$(PLATFORM): $(PCFILE)
	@$(MAKE) -C $(PLATFORM) install
	@touch $@

clean:
	@$(MAKE) -C $(PLATFORM) clean
	@rm -f .install-$(PLATFORM)

distclean:
	@rm -rf $(PLATFORM) .install-$(PLATFORM)

