# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

PHP_EXT_NAME="xhprof"
PHP_EXT_INI="yes"
PHP_EXT_ZENDEXT="no"
DOCS="README ChangeLog LICENSE"

inherit php-ext-pecl-r2

DESCRIPTION="PHP extension to profile applications"
HOMEPAGE="http://pecl.php.net/package/xhprof"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~x86"
IUSE="examples ui"

DEPEND=""
RDEPEND="ui? ( || ( virtual/httpd-cgi virtual/httpd-fastcgi ) )"

S=${WORKDIR}/${PECL_PKG_V}/extension
PHP_EXT_S=${S}
DOCSDIR=${WORKDIR}/${PECL_PKG_V}

src_prepare() {

	php-ext-source-r2_src_prepare

	cd ${S}/..
	epatch ${FILESDIR}/${PV}/01_include_path.patch
}

src_install() {

	php-ext-pecl-r2_src_install

	php-ext-source-r2_addtoinifiles "xhprof.output_dir" '"/var/tmp/xhprof"'

	dodir /var/tmp/xhprof

	if use ui; then
		insinto /var/www/localhost/htdocs/${PHP_EXT_NAME}	
		doins -r ${WORKDIR}/${PECL_PKG_V}/xhprof_html/*
		insinto ${PHP_EXT_SHARED_DIR}
		doins -r ${WORKDIR}/${PECL_PKG_V}/xhprof_lib/*
	fi
}
