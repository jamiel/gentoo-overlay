# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit php-pear-lib-r1 depend.php

KEYWORDS="~amd64 ~x86"

DESCRIPTION="Object Persistence Layer for PHP 5 (Generator)."
HOMEPAGE="http://propel.phpdb.org/trac/wiki/"
SRC_URI="http://pear.phpdb.org/get/propel_generator-${PV/_/}.tgz"
LICENSE="LGPL-2.1"
SLOT="0"
IUSE="minimal"

DEPEND=">=dev-lang/php-5.2.0"
RDEPEND="${DEPEND}
	>=dev-php5/phing-2.3.0"

S="${WORKDIR}/propel_generator-${PV/_/}"

pkg_setup() {
	# We need PDO and a few other things
	require_php_with_use pdo reflection spl xml xsl
}
