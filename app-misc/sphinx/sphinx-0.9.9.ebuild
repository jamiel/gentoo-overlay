# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-misc/sphinx/sphinx-0.9.9_rc2.ebuild,v 1.1 2009/07/23 21:48:24 gengor Exp $

inherit eutils autotools

MY_P=${P/_/-}

DESCRIPTION="Full-text search engine with support for MySQL and PostgreSQL"
HOMEPAGE="http://www.sphinxsearch.com/"
SRC_URI="http://sphinxsearch.com/downloads/${MY_P}.tar.gz
	stemmer? ( http://snowball.tartarus.org/dist/libstemmer_c.tgz )"
RESTRICT="mirror"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="debug id64 mysql postgres stemmer test"

DEPEND="mysql? ( virtual/mysql )
	postgres? ( virtual/postgresql-base )"
RDEPEND="${DEPEND}
	test? ( dev-lang/php )"

S=${WORKDIR}/${MY_P}

src_unpack() {
	unpack ${MY_P}.tar.gz
	if use stemmer; then
		cd "${S}"
		unpack libstemmer_c.tgz
	fi
	cd "${S}"
	eautoreconf
}

src_compile() {
	econf \
		--sysconfdir="/etc/${PN}" \
		$(use_enable id64) \
		$(use_with debug) \
		$(use_with mysql) \
		$(use_with postgres pgsql) \
		$(use_with stemmer libstemmer)

	emake || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "install failed"
	dodoc doc/*

	dodir /var/lib/sphinx
	dodir /var/log/sphinx
	dodir /var/run/sphinx
}
