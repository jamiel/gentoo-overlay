# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

PHP_EXT_NAME="gnupg"
PHP_EXT_INI="yes"
PHP_EXT_ZENDEXT="no"

EAPI="2"

inherit php-ext-pecl-r1 eutils

KEYWORDS="~amd64 ~x86"
DESCRIPTION="PHP wrapper around the gpgme library"
LICENSE="BSD-2"
SLOT="0"
IUSE=""

DEPEND="app-crypt/gpgme"
RDEPEND="${DEPEND}"

need_php_by_category

src_prepare() {
	cd ${S}
	epatch "${FILESDIR}"/"${PV}"/01-large_file_system.patch
	epatch "${FILESDIR}"/"${PV}"/02-gpgme_new_seg_fault.patch
	eautoreconf
}
