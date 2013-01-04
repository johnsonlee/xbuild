include ../Makefile.include

LIBNAME = libpng
LIBVER  = 1.5.13
LIBURL  = http://nchc.dl.sourceforge.net/project/libpng/libpng15/1.5.13
LIBSRC  = $(LIBNAME)-$(LIBVER)
LIBFILE = $(LIBSRC).tar.xz

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

