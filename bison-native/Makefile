NATIVE_BUILD=1

include ../Makefile.include

LIBNAME = bison
LIBVER  = 2.7
LIBURL  = http://ftp.gnu.org/gnu/bison
LIBSRC  = $(LIBNAME)-$(LIBVER)
LIBFILE = $(LIBSRC).tar.xz

BINFILE = $(PREFIX)/bin/bison

all: .install-$(PLATFORM)

$(TARBALLS_LOCATION)/$(LIBFILE):
	@echo "Downloading from $(LIBURL)/$(LIBFILE)"
	@$(WGET) $(WGET_FLAGS) $(LIBURL)/$(LIBFILE)

$(PLATFORM): $(TARBALLS_LOCATION)/$(LIBFILE)
	@rm -rf $(PLATFORM)/*; mkdir -p $(PLATFORM)
	@$(TAR) $(TAR_FLAGS) $(TARBALLS_LOCATION)/$(LIBFILE)
	@cd $(PLATFORM); ./configure --prefix=$(PREFIX)

$(BINFILE): $(PLATFORM)
	@$(MAKE) -C $(PLATFORM)

.install-$(PLATFORM): $(BINFILE)
	@$(MAKE) -C $(PLATFORM) install
	@touch $@

clean:
	@$(MAKE) -C $(PLATFORM) clean
	@rm -f .install-$(PLATFORM)

distclean:
	@rm -rf $(PLATFORM) .install-$(PLATFORM)

