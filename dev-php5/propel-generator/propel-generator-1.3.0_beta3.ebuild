# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-php5/propel-generator/propel-generator-1.3.0_beta3.ebuild,v 1.1 2007/12/24 14:51:03 armin76 Exp $

inherit php-pear-lib-r1

KEYWORDS="~amd64 ~x86"

DESCRIPTION="Object Persistence Layer for PHP 5 (Generator)."
HOMEPAGE="http://propel.phpdb.org/trac/wiki/"
SRC_URI="http://pear.phpdb.org/get/propel_generator-${PV/_/}.tgz"
LICENSE="LGPL-2.1"
SLOT="0"
IUSE="minimal"

DEPEND=">=dev-lang/php-5.2.0"
RDEPEND="${DEPEND}
	>=dev-php5/phing-2.2.0"
PDEPEND="!minimal? ( >=dev-php5/creole-1.1.0 )"

S="${WORKDIR}/propel_generator-${PV/_/}"

pkg_setup() {
	# We need PDO and a few other things
	require_php_with_use pdo reflection spl xml xsl
}
