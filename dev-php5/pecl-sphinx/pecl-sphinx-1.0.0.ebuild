# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

PHP_EXT_NAME="sphinx"
PHP_EXT_INI="yes"
PHP_EXT_ZENDEXT="no"
DOCS="README ChangeLog"

inherit php-ext-pecl-r1

DESCRIPTION="PHP extension to execute search queries on a sphinx daemon"
HOMEPAGE="http://pecl.php.net/package/sphinx"

LICENSE="PHP"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="dev-libs/libsphinxclient"
