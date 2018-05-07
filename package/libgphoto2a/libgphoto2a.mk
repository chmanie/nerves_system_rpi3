
################################################################################
#
# libgphoto2a
#
################################################################################

LIBGPHOTO2A_VERSION = 2.5.17
LIBGPHOTO2A_SOURCE = libgphoto2-$(LIBGPHOTO2A_VERSION).tar.bz2
# Project is maintained on github but github tarball doesn't have
# configure, so use tarballs from SourceForge
LIBGPHOTO2A_SITE = https://downloads.sourceforge.net/project/gphoto/libgphoto/$(LIBGPHOTO2A_VERSION)
LIBGPHOTO2A_LICENSE = LGPL-2.1+, GPL-2.0 (adc65), GPL-2.0+ (some camlibs), \
	LGPL-2.0 (sipix), LGPL-3.0+ (pentax), BSD-3-Clause (ax203/tinyjpeg)
# There is a single license file for the LGPL-2.1, no license files
# for other licenses
LIBGPHOTO2A_LICENSE_FILES = COPYING
LIBGPHOTO2A_INSTALL_STAGING = YES

LIBGPHOTO2A_DEPENDENCIES = libxml2 libusb libtool host-pkgconf

LIBGPHOTO2A_CONF_ENV = udevscriptdir=/lib/udev
LIBGPHOTO2A_CONF_OPTS += --without-rpmbuild --disable-gp2ddb --disable-internal-docs

ifeq ($(BR2_PACKAGE_LIBUSB_COMPAT),y)
# libusb-compat is not actually used, but it is detected, so add it
# here to guarantee reproducible builds
LIBGPHOTO2A_DEPENDENCIES += libusb-compat
endif

ifeq ($(BR2_PACKAGE_LIBEXIF),y)
LIBGPHOTO2A_DEPENDENCIES += libexif
LIBGPHOTO2A_CONF_OPTS += --with-libexif=auto
else
LIBGPHOTO2A_CONF_OPTS += --with-libexif=no
endif

ifeq ($(BR2_PACKAGE_JPEG),y)
LIBGPHOTO2A_DEPENDENCIES += jpeg
LIBGPHOTO2A_CONF_OPTS += --with-jpeg
else
LIBGPHOTO2A_CONF_OPTS += --without-jpeg
endif

ifeq ($(BR2_PACKAGE_GD),y)
LIBGPHOTO2A_DEPENDENCIES += gd
LIBGPHOTO2A_CONF_OPTS += --with-gdlib=auto
else
LIBGPHOTO2A_CONF_OPTS += --with-gdlib=no
endif

ifeq ($(BR2_PACKAGE_LOCKDEV),y)
LIBGPHOTO2A_DEPENDENCIES += lockdev
endif

$(eval $(autotools-package))
