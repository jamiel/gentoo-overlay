# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-php/pecl-bbcode/pecl-bbcode-1.0.3_beta1.ebuild,v 1.2 2012/01/15 17:03:12 olemarkus Exp $

EAPI="4"

PHP_EXT_NAME="bbcode"
PHP_EXT_INI="yes"
PHP_EXT_ZENDEXT="no"
DOCS="TODO"

USE_PHP="php5-3 php5-4"

KEYWORDS="~amd64 ~x86"

MY_PV="${PV/_beta/b}"
PECL_PKG_V="${PECL_PKG}-${MY_PV}"
S="${WORKDIR}/${PECL_PKG_V}"

inherit php-ext-pecl-r2

DESCRIPTION="A quick and efficient BBCode Parsing Library."
LICENSE="PHP-3.01 BSD"
SLOT="0"
IUSE=""
