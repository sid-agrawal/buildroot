################################################################################
#
# libks
#
################################################################################

LIBPFS_VERSION = 1.0.0
LIBPFS_SITE = $(call github,sid-agrawal,pfs,v$(LIBPFS_VERSION))
LIBPFS_LICENSE = MIT
LIBPFS_LICENSE_FILES = copyright
LIBPFS_INSTALL_STAGING = YES

$(eval $(cmake-package))
