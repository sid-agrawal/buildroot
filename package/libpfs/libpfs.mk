################################################################################
#
# libks
#
################################################################################

LIBPFS_VERSION = e3e998d
LIBPFS_SITE = $(call github,sid-agrawal,pfs,$(LIBPFS_VERSION))
LIBPFS_LICENSE = MIT
LIBPFS_LICENSE_FILES = copyright
LIBPFS_INSTALL_STAGING = YES
LIBPFS_DEPENDENCIES = python-pybind11 python3
LIBPFS_CONF_OPTS = -Dpfs_BUILDROOT=ON

$(eval $(cmake-package))
