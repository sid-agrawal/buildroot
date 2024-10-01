################################################################################
#
# libks
#
################################################################################

LIBPFS_VERSION = 1.0.1
LIBPFS_SITE = $(call github,sid-agrawal,pfs,v$(LIBPFS_VERSION))
LIBPFS_LICENSE = MIT
LIBPFS_LICENSE_FILES = copyright
LIBPFS_INSTALL_STAGING = YES
LIBPFS_DEPENDENCIES = python-pybind11 python3
LIBPFS_CONF_OPTS = -Dpfs_BUILDROOT=ON

$(eval $(cmake-package))
