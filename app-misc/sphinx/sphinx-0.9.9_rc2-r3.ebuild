# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-misc/sphinx/sphinx-0.9.9_rc2-r2.ebuild,v 1.2 2009/11/22 22:05:20 robbat2 Exp $

EAPI=2
inherit eutils autotools

MY_P=${P/_/-}

# This has been added by Gentoo, to explicitly version libstemmer.
# It is the date that http://snowball.tartarus.org/dist/libstemmer_c.tgz was
# fetched.
STEMMER_PV="20091122"
DESCRIPTION="Full-text search engine with support for MySQL and PostgreSQL"
HOMEPAGE="http://www.sphinxsearch.com/"
SRC_URI="http://sphinxsearch.com/downloads/${MY_P}.tar.gz
	stemmer? ( mirror://gentoo/libstemmer_c-${STEMMER_PV}.tgz )"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="client debug id64 mysql postgres stemmer test"

RDEPEND="mysql? ( virtual/mysql )
	postgres? ( virtual/postgresql-base )"
DEPEND="${RDEPEND}
	test? ( dev-lang/php )"

S=${WORKDIR}/${MY_P}
CLIENT_S="${S}/api/libsphinxclient"

src_unpack() {
	unpack ${MY_P}.tar.gz
	if use stemmer; then
		cd "${S}"
		unpack libstemmer_c-${STEMMER_PV}.tgz
	fi
}

src_prepare() {
	eautoreconf
}

src_configure() {
	econf \
		--sysconfdir="/etc/${PN}" \
		$(use_enable id64) \
		$(use_with debug) \
		$(use_with mysql) \
		$(use_with postgres pgsql) \
		$(use_with stemmer libstemmer)

	if use client; then
		cd ${CLIENT_S}
		./buildconf.sh
		econf
		cd ${S}
	fi
}

src_compile() {
	emake || die "emake failed"

	if use client; then
		cd ${CLIENT_S}
		emake
		cd ${S}
	fi
}

src_install() {
	emake DESTDIR="${D}" install || die "install failed"

	if use client; then
		cd ${CLIENT_S}
		einstall
		cd ${S}
	fi

	dodoc doc/*

	dodir /var/lib/sphinx
	dodir /var/log/sphinx
	dodir /var/run/sphinx

	newinitd "${FILESDIR}"/searchd.rc searchd
}
