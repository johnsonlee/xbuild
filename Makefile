BUILDTOOLS=help2man-native autoconf-native automake-native gettext-native libtool-native pkg-config-native

SUBDIRS=\
	expat \
	gettext \
	glib glib-native \
	libffi libffi-native \
	libiconv \
	libjpeg \
	libpng \
	libtiff \
	libxml2 libxml2-native \
	libxslt libxslt-native \
	python27 python27-native \
	zlib zlib-native

.PHONY: buildtools $(BUILDTOOLS) subdirs $(SUBDIRS)

all: subdirs

glib: libiconv zlib
libxml2: zlib python27
python27: python27-native
zlib: zlib-native

buildtools: $(BUILDTOOLS)
$(BUILDTOOLS):
	@$(MAKE) -C $@

subdirs: $(SUBDIRS)
$(SUBDIRS): $(BUILDTOOLS)
	@$(MAKE) all -C $@

clean:
	@for d in $(BUILDTOOLS); do $(MAKE) -C $$d $@; done
	@for d in $(SUBDIRS); do $(MAKE) -C $$d $@; done

distclean:
	@for d in $(BUILDTOOLS); do $(MAKE) -C $$d $@; done
	@for d in $(SUBDIRS); do $(MAKE) -C $$d $@; done

