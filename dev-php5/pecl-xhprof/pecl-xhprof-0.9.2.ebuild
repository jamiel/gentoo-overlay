# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

PHP_EXT_NAME="xhprof"
PHP_EXT_INI="yes"
PHP_EXT_ZENDEXT="no"
DOCS="README ChangeLog LICENSE CREDITS"

inherit php-ext-pecl-r1

DESCRIPTION="PHP extension to profile applications"
HOMEPAGE="http://pecl.php.net/package/xhprof"

LICENSE="PHP"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

S=${WORKDIR}/${PECL_PKG_V}/extension

src_install() {
	php-ext-source-r1_src_install

	php-ext-base-r1_addtoinifiles "xhprof.output_dir" '"/tmp/xhprof"'
}
