NATIVE_BUILD=1

include ../Makefile.include

LIBNAME = Python
LIBVER  = 2.7.3
LIBURL  = http://www.python.org/ftp/python/2.7.3
LIBSRC  = $(LIBNAME)-$(LIBVER)
LIBFILE = $(LIBSRC).tar.bz2

BINFILE = $(PREFIX)/bin/python

all: .install-$(PLATFORM)

$(TARBALLS_LOCATION)/$(LIBFILE):
	@echo "Downloading $(LIBURL)/$(LIBFILE) -> $(TARBALLS_LOCATION)"
	@$(WGET) $(WGET_FLAGS) $(LIBURL)/$(LIBFILE)

$(PLATFORM): $(TARBALLS_LOCATION)/$(LIBFILE)
	@rm -rf $(PLATFORM)/*; mkdir -p $(PLATFORM)
	@$(TAR) $(TAR_FLAGS) $(TARBALLS_LOCATION)/$(LIBFILE)
	@cd $(PLATFORM); ./configure --prefix=$(PREFIX)

$(BINFILE): $(PLATFORM)
	@$(MAKE) -C $(PLATFORM)
	@if [ ! -f $(PREFIX)/bin/pgen ]; then cp -v $(PLATFORM)/Parser/pgen $(PREFIX)/bin; fi

.install-$(PLATFORM): $(BINFILE)
	@$(MAKE) -C $(PLATFORM) install
	@touch $@

clean:
	@$(MAKE) -C $(PLATFORM) clean
	@rm -f .install-$(PLATFORM)

distclean:
	@rm -rf $(PLATFORM) .install-$(PLATFORM)

