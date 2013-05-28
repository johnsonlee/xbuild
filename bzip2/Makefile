include ../Makefile.include

LIBNAME = bzip2
LIBVER  = 1.0.6
LIBURL  = http://bzip.org/1.0.6
LIBSRC  = $(LIBNAME)-$(LIBVER)
LIBFILE = $(LIBSRC).tar.gz

BINFILE = $(PREFIX)/lib/libbz2.so $(PREFIX)/lib/libbz2.a

all: .install-$(PLATFORM)

$(TARBALLS_LOCATION)/$(LIBFILE):
	@echo "Downloading $(LIBURL)/$(LIBFILE) -> $(TARBALLS_LOCATION)"
	@$(WGET) $(WGET_FLAGS) $(LIBURL)/$(LIBFILE)

$(PLATFORM): $(TARBALLS_LOCATION)/$(LIBFILE) Makefile.patch
	@rm -rf $(PLATFORM)/*; mkdir -p $(PLATFORM)
	@$(TAR) $(TAR_FLAGS) $(TARBALLS_LOCATION)/$(LIBFILE)
	@cd $(PLATFORM); patch -p1 < ../libbz2-xcompile.patch

$(BINFILE): $(PLATFORM)
	@$(MAKE) -C $(PLATFORM) PREFIX=$(PREFIX)
	@$(MAKE) -C $(PLATFORM) -f Makefile-libbz2_so PREFIX=$(PREFIX)

.install-$(PLATFORM): $(BINFILE)
	@$(MAKE) -C $(PLATFORM) install PREFIX=$(PREFIX)
	@$(MAKE) -C $(PLATFORM) -f Makefile-libbz2_so install PREFIX=$(PREFIX)
	@touch $@

clean:
	@$(MAKE) -C $(PLATFORM) clean
	@rm -f .install-$(PLATFORM)

distclean:
	@rm -rf $(PLATFORM) .install-$(PLATFORM)

