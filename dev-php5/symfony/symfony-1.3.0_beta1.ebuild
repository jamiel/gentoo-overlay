# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-php5/symfony/symfony-1.2.0.ebuild,v 1.1 2008/12/03 17:48:51 wrobel Exp $

inherit php-pear-lib-r1 depend.php versionator

KEYWORDS="~amd64 ~x86"
MY_PV=$(delete_version_separator '_' ${P/beta/BETA})

DESCRIPTION="Open-source PHP5 professional web framework."
HOMEPAGE="http://www.symfony-project.com/"
SRC_URI="http://pear.symfony-project.com/get/${MY_PV}.tgz"
S=${WORKDIR}/${MY_PV}
LICENSE="MIT LGPL-2.1 BSD BSD-2 FDL-1.2"
SLOT="0"
IUSE=""

need_php_by_category

pkg_setup() {
	# Symfony needs some features in PHP5 in order to work
	require_php_with_use cli ctype reflection spl simplexml xml pcre session
}
