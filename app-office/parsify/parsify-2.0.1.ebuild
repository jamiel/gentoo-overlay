# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit unpacker xdg

MY_PN="Parsify"

DESCRIPTION="Parsify is a powerful notepad-based calculator"
HOMEPAGE="https://parsify.app"
SRC_URI="https://github.com/parsify-dev/desktop/releases/download/v${PV}/Parsify-${PV}-linux-amd64.deb"
SLOT="0"
S="${WORKDIR}"
KEYWORDS="~amd64"
IUSE=""
RDEPEND=""
DEPEND="${RDEPEND}"
BDEPEND="app-alternatives/gzip"

src_install() {
	insinto /opt/${MY_PN}
	doins -r ./opt/${MY_PN}/*
	insinto /usr/share/icons
    doins -r ./usr/share/icons/*
	insinto /usr/share/applications
	doins -r ./usr/share/applications/*
	dosym -r /opt/${MY_PN}/@parsifydesktop /usr/bin/parsify
	fperms 0755 /usr/bin/parsify
	gunzip ./usr/share/doc/${PN}/changelog.gz || die
	dodoc -r usr/share/doc/${PN}/*
}

pkg_postinst() {
	xdg_desktop_database_update
	xdg_icon_cache_update
}
