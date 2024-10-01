################################################################################
#
# python-pybind11
#
################################################################################

PYTHON_PYBIND11_VERSION = 2.13.6
PYTHON_PYBIND11_SOURCE = pybind11-$(PYTHON_PYBIND11_VERSION).tar.gz
PYTHON_PYBIND11_SITE = https://files.pythonhosted.org/packages/d2/c1/72b9622fcb32ff98b054f724e213c7f70d6898baa714f4516288456ceaba
PYTHON_PYBIND11_SETUP_TYPE = setuptools
PYTHON_PYBIND11_LICENSE = FIXME: please specify the exact BSD version
PYTHON_PYBIND11_LICENSE_FILES = LICENSE

$(eval $(python-package))
