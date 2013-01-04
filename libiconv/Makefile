include ../Makefile.include

LIBNAME = libiconv
LIBVER  = 1.14
LIBURL  = http://ftp.gnu.org/gnu/libiconv
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
	@cd $(PLATFORM); ./configure --prefix=$(PREFIX) --host=$(HOST)

clean:
	@$(MAKE) -C $(PLATFORM) clean
	@rm -f .install-$(PLATFORM)

distclean:
	@rm -rf $(PLATFORM) .install-$(PLATFORM)

