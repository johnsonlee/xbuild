include ../Makefile.include

LIBNAME = libffi
LIBVER  = 3.0.11
LIBURL  = ftp://sourceware.org/pub/libffi
LIBSRC  = $(LIBNAME)-$(LIBVER)
LIBFILE = $(LIBSRC).tar.gz

PCFILE = $(PREFIX)/lib/pkgconfig/$(LIBNAME).pc

all: .install-$(PLATFORM)

$(TARBALLS_LOCATION)/$(LIBFILE):
	@echo "Downloading from $(LIBURL)/$(LIBFILE)"
	@$(WGET) $(WGET_FLAGS) $(LIBURL)/$(LIBFILE)

$(PLATFORM): $(TARBALLS_LOCATION)/$(LIBFILE)
	@rm -rf $(PLATFORM)/*; mkdir -p $(PLATFORM)
	@$(TAR) $(TAR_FLAGS) $(TARBALLS_LOCATION)/$(LIBFILE)
	@cd $(PLATFORM); ./configure --build=$(BUILD) --host=$(HOST) --prefix=$(PREFIX)

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

