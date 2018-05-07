################################################################################
#
# gphoto2
#
################################################################################

GPHOTO2_VERSION = 2.5.17
GPHOTO2_SOURCE = gphoto2-$(GPHOTO2_VERSION).tar.bz2

# Project is maintained on github but github tarball doesn't have
# configure, so use tarballs from SourceForge

GPHOTO2_SITE = https://astuteinternet.dl.sourceforge.net/project/gphoto/gphoto/$(GPHOTO2_VERSION)/gphoto2-2.5.17.tar.bz2

GPHOTO2_LICENSE_FILES = COPYING
GPHOTO2_INSTALL_STAGING = YES

GPHOTO2_DEPENDENCIES = popt libgphoto2a

GPHOTO2_CONF_ENV = POPT_CFLAGS="-I/nerves/build/target/usr/include/" POPT_LIBS="-L/nerves/build/target/usr/lib -lpopt"
# GPHOTO2_CONF_OPTS += --without-cdk

$(eval $(autotools-package))
