# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
EAPI=8

inherit go-module

DESCRIPTION="CLI tool that extracts data from a source storage/database and loads it in a target storage/database"
HOMEPAGE="https://slingdata.io"
SRC_URI="https://github.com/slingdata-io/sling-cli/archive/refs/tags/v${PV}.tar.gz"
SRC_URI+=" https://github.com/jamiel/gentoo-overlay-files/raw/refs/heads/main/sling-${PV}-vendor.tar.xz"
SLOT="0"
S="${WORKDIR}/sling-cli-${PV}"
KEYWORDS="~amd64"
IUSE=""
RDEPEND=""
DEPEND="${RDEPEND}"
LICENSE="GPL-3"

src_compile() {
	ego build -o "${PN}" cmd/sling/*.go
}

src_install() {
	dobin "${PN}"
}
