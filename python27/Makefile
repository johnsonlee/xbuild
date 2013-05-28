include ../Makefile.include

LIBNAME = Python
LIBVER  = 2.7.3
LIBURL  = http://www.python.org/ftp/python/$(LIBVER)
LIBSRC  = $(LIBNAME)-$(LIBVER)
LIBFILE = $(LIBSRC).tar.bz2

BINFILE = $(PREFIX)/bin/python

all: .install-$(PLATFORM)

$(TARBALLS_LOCATION)/$(LIBFILE):
	@echo "Downloading from $(LIBURL)/$(LIBFILE)"
	@$(WGET) $(WGET_FLAGS) $(LIBURL)/$(LIBFILE)

$(PLATFORM): $(TARBALLS_LOCATION)/$(LIBFILE) $(LIBSRC)-xcompile.patch
	@rm -rf $(PLATFORM)/*; mkdir -p $(PLATFORM)
	@$(TAR) $(TAR_FLAGS) $(TARBALLS_LOCATION)/$(LIBFILE)
	@cd $(PLATFORM); patch -p1 < ../$(LIBSRC)-xcompile.patch; ./configure --build=$(BUILD) --host=$(HOST) --prefix=$(PREFIX) --enable-unicode=ucs4 --with-system-ffi

$(BINFILE): $(PLATFORM)
	@$(MAKE) -C $(PLATFORM) HOSTPYTHON=$(NATIVEPREFIX)/bin/python HOSTPGEN=$(NATIVEPREFIX)/bin/pgen CROSS_COMPILE_TARGET=yes

.install-$(PLATFORM): $(BINFILE)
	@$(MAKE) -C $(PLATFORM) install HOSTPYTHON=$(NATIVEPREFIX)/bin/python HOSTPGEN=$(NATIVEPREFIX)/bin/pgen CROSS_COMPILE_TARGET=yes
	@touch $@

clean:
	@$(MAKE) -C $(PLATFORM) clean
	@rm -f .install-$(PLATFORM)

distclean:
	@rm -rf $(PLATFORM) .install-$(PLATFORM)

