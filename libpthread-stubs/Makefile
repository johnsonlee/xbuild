include ../Makefile.include

LIBNAME = libpthread-stubs
LIBVER  = 0.3
LIBURL  = http://xcb.freedesktop.org/dist
LIBSRC  = $(LIBNAME)-$(LIBVER)
LIBFILE = $(LIBSRC).tar.gz

all: .install-$(PLATFORM)

$(TARBALLS_LOCATION)/$(LIBFILE):
	@echo "Downloading $(LIBURL)/$(LIBFILE) -> $(TARBALLS_LOCATION)"
	@$(WGET) $(WGET_FLAGS) $(LIBURL)/$(LIBFILE)

$(PLATFORM): $(TARBALLS_LOCATION)/$(LIBFILE)
	@rm -rf $(PLATFORM)/*; mkdir -p $(PLATFORM)
	@$(TAR) $(TAR_FLAGS) $(TARBALLS_LOCATION)/$(LIBFILE)

.install-$(PLATFORM): configure
	@$(MAKE) -C $(PLATFORM)
	@$(MAKE) -C $(PLATFORM) install
	@touch $@

configure: $(PLATFORM)
	@cd $(PLATFORM); ./configure --host=$(HOST) --prefix=$(PREFIX)

clean:
	@$(MAKE) -C $(PLATFORM) clean
	@rm -f .install-$(PLATFORM)

distclean:
	@rm -rf $(PLATFORM) .install-$(PLATFORM)

