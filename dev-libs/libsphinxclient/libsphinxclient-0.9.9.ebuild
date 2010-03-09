# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-misc/sphinx/sphinx-0.9.9_rc2-r2.ebuild,v 1.2 2009/11/22 22:05:20 robbat2 Exp $

EAPI=2
inherit eutils autotools

MY_P="sphinx-${PV}"

DESCRIPTION="Provides the libsphinxclient libraries which can be used to build interfaces to the sphinx searchd daemon"
HOMEPAGE="http://www.sphinxsearch.com/"
SRC_URI="http://sphinxsearch.com/downloads/${MY_P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="client debug id64 mysql postgres stemmer test"

RDEPEND=""
DEPEND=""

S=${WORKDIR}/${MY_P}/api/libsphinxclient

src_prepare() {
	epatch "${FILESDIR}/${PV}/01_all_sphinxclient_static_decl.patch"
}

src_configure() {
	bash buildconf.sh
	econf 
}

src_install() {
	einstall || die "make install failed"
}
