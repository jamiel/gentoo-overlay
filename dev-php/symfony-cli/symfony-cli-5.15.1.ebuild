# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
EAPI=8

inherit go-module

DESCRIPTION="Symfony CLI tool"
HOMEPAGE="https://github.com/symfony-cli/symfony-cli"
SRC_URI="https://github.com/symfony-cli/symfony-cli/archive/refs/tags/v${PV}.tar.gz"
SRC_URI+=" https://github.com/jamiel/gentoo-overlay-files/raw/refs/heads/main/symfony-cli-${PV}-vendor.tar.xz"
SLOT="0"
S="${WORKDIR}/symfony-cli-${PV}"
KEYWORDS="~amd64"
IUSE=""
RDEPEND=""
DEPEND="${RDEPEND}"
LICENSE="GPL-3"

src_compile() {
	ego build -o "${PN}" .
}

src_install() {
	dobin "${PN}"
	dosym "${PN}" /usr/bin/symfony
}
