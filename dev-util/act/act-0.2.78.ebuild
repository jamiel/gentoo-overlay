# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module

DESCRIPTION="Run your GitHub Actions locally"
HOMEPAGE="https://nektosact.com"
SRC_URI="
	https://github.com/nektos/act/archive/refs/tags/v${PV}.tar.gz
	https://github.com/jamiel/gentoo-overlay-files/raw/refs/heads/main/act-${PV}-vendor.tar.xz
"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
RDEPEND=""
DEPEND="${RDEPEND}"
LICENSE="MIT"

src_compile() {
	emake build
}

src_install() {
	dobin "dist/local/${PN}"
}
