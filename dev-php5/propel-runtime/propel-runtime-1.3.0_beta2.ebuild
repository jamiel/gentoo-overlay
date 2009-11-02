# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-php5/propel-runtime/propel-runtime-1.3.0_beta2.ebuild,v 1.1 2007/03/20 18:36:50 chtekk Exp $

inherit php-pear-lib-r1

KEYWORDS="~amd64 ~x86"

DESCRIPTION="Object Persistence Layer for PHP 5 (Runtime)."
HOMEPAGE="http://propel.phpdb.org/trac/wiki/"
SRC_URI="http://pear.phpdb.org/get/propel_runtime-${PV/_/}.tgz"
LICENSE="LGPL-2.1"
SLOT="0"
IUSE=""

DEPEND=""
RDEPEND=">=dev-php/PEAR-Log-1.8.7-r1"

S="${WORKDIR}/propel_runtime-${PV/_/}"

need_php_by_category

pkg_setup() {
	has_php

	# We need PDO and a few other things
	require_pdo
	require_php_with_use reflection spl xml xsl
}
