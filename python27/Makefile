include ../Makefile.include

LIBNAME = Python
LIBVER  = 2.7.3
LIBURL  = http://www.python.org/ftp/python/2.7.3
LIBSRC  = $(LIBNAME)-$(LIBVER)
LIBFILE = $(LIBSRC).tar.bz2

all: .install-$(PLATFORM)

$(TARBALLS_LOCATION)/$(LIBFILE):
	@echo "Downloading $(LIBURL)/$(LIBFILE) -> $(TARBALLS_LOCATION)"
	@$(WGET) $(WGET_FLAGS) $(LIBURL)/$(LIBFILE)

$(PLATFORM): $(TARBALLS_LOCATION)/$(LIBFILE)
	@rm -rf $(PLATFORM)/*; mkdir -p $(PLATFORM)
	@$(TAR) $(TAR_FLAGS) $(TARBALLS_LOCATION)/$(LIBFILE)

.install-$(PLATFORM): configure
	@$(MAKE) -C $(PLATFORM) HOSTPYTHON=$(NATIVEPREFIX)/bin/python HOSTPGEN=$(NATIVEPREFIX)/bin/pgen CROSS_COMPILE_TARGET=yes
	@$(MAKE) -C $(PLATFORM) install HOSTPYTHON=$(NATIVEPREFIX)/bin/python HOSTPGEN=$(NATIVEPREFIX)/bin/pgen CROSS_COMPILE_TARGET=yes
	@touch $@

configure: $(PLATFORM) patch
	@cd $(PLATFORM); ./configure --host=$(HOST) --prefix=$(PREFIX) --with-system-ffi --enable-unicode=ucs4

patch: $(LIBSRC)-xcompile.patch
	@cd $(PLATFORM); patch -Np1 < ../$<

clean:
	@$(MAKE) -C $(PLATFORM) clean
	@rm -f .install-$(PLATFORM)

distclean:
	@rm -rf $(PLATFORM) .install-$(PLATFORM)

