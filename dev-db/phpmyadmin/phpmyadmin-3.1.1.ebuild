# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-db/phpmyadmin/phpmyadmin-3.1.1.ebuild,v 1.1 2008/12/28 20:53:39 wrobel Exp $

inherit eutils webapp depend.php

MY_PV=${PV/_/-}
MY_P="phpMyAdmin-${MY_PV}-all-languages"

DESCRIPTION="Web-based administration for MySQL database in PHP"
HOMEPAGE="http://www.phpmyadmin.net/"
SRC_URI="mirror://sourceforge/${PN}/${MY_P}.tar.bz2"

LICENSE="GPL-2"
KEYWORDS="~alpha ~amd64 ~hppa ~ppc ~ppc64 ~sparc ~x86 ~x86-fbsd"
IUSE=""

RDEPEND=">=dev-db/mysql-5.0.15"

need_httpd_cgi
need_php_httpd

S="${WORKDIR}"/${MY_P}

pkg_setup() {
	webapp_pkg_setup

	if ! PHPCHECKNODIE="yes" require_php_with_use crypt ctype filter pcre session spl unicode \
		|| ! PHPCHECKNODIE="yes" require_php_with_any_use mysql mysqli ; then
		eerror
		eerror "${PHP_PKG} needs to be re-installed with all of the following"
		eerror "USE flags enabled:"
		eerror
		eerror "crypt ctype filter pcre session spl unicode"
		eerror
		eerror "as well as any of the following USE flags enabled:"
		eerror
		eerror "mysql or mysqli if using dev-lang/php-5"
		eerror
		die "Re-install ${PHP_PKG}"
	fi
}

src_install() {
	webapp_src_preinst

	dodoc CREDITS Documentation.txt INSTALL README RELEASE-DATE-${MY_PV} TODO ChangeLog
	rm -f LICENSE CREDITS INSTALL README RELEASE-DATE-${MY_PV} TODO

	insinto "${MY_HTDOCSDIR}"
	doins -r .

	webapp_configfile "${MY_HTDOCSDIR}"/libraries/config.default.php
	webapp_serverowned "${MY_HTDOCSDIR}"/libraries/config.default.php

	webapp_postinst_txt en "${FILESDIR}"/postinstall-en-3.1.1.txt
	webapp_hook_script "${FILESDIR}"/reconfig-2.8
	webapp_src_install
}
