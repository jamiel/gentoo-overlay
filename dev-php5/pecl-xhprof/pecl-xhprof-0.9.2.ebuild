# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

PHP_EXT_NAME="xhprof"
PHP_EXT_INI="yes"
PHP_EXT_ZENDEXT="no"
DOCS="README ChangeLog LICENSE"

inherit php-ext-pecl-r1

DESCRIPTION="PHP extension to profile applications"
HOMEPAGE="http://pecl.php.net/package/xhprof"

LICENSE="PHP"
SLOT="0"
KEYWORDS="~x86"
IUSE="examples ui"

DEPEND=""
RDEPEND="ui? ( || ( virtual/httpd-cgi virtual/httpd-fastcgi ) )"

S=${WORKDIR}/${PECL_PKG_V}/extension
DOCSDIR=${WORKDIR}/${PECL_PKG_V}

need_php

src_prepare() {
	cd ${S}/..
	epatch ${FILESDIR}/${PV}/01_include_path.patch
}

src_install() {

	php-ext-pecl-r1_src_install

	php-ext-base-r1_addtoinifiles "xhprof.output_dir" '"/var/tmp/xhprof"'

	dodir /var/tmp/xhprof

	if use ui; then
		insinto /var/www/localhost/htdocs/${PHP_EXT_NAME}	
		doins -r ${WORKDIR}/${PECL_PKG_V}/xhprof_html/*
		insinto /usr/share/${PHP_SHARED_CAT}/${PHP_EXT_NAME}
		doins -r ${WORKDIR}/${PECL_PKG_V}/xhprof_lib/*
	fi
}
