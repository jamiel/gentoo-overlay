# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/rst2pdf/rst2pdf-0.12.3.ebuild,v 1.1 2010/03/06 01:31:22 yngwin Exp $

EAPI=3
PYTHON_DEPEND="2"

inherit distutils

DESCRIPTION="Tool for transforming reStructuredText to PDF using ReportLab"
HOMEPAGE="http://rst2pdf.googlecode.com/"
SRC_URI="http://rst2pdf.googlecode.com/files/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="dev-python/docutils
	dev-python/imaging
	dev-python/pygments
	=dev-python/reportlab-2.3*"
DEPEND="${RDEPEND}
	test? ( dev-python/pyPdf )"
RESTRICT_PYTHON_ABIS="3.*"

src_install() {
	distutils_src_install
	doman doc/rst2pdf.1 || die
	dodoc {README,CHANGES,Contributors}.txt || die
	dodoc doc/* || die
	insinto /usr/share/doc/${PF}/examples
	doins doc/montecristo/* || die
}

pkg_postinst() {
	elog 'rst2pdf can work with the following packages for additional functionality:'
	elog '   dev-python/sphinx       - versatile documentation creation'
	elog '   dev-python/pythonmagick - image processing with ImageMagick'
	elog '   dev-python/matplotlib   - mathematical formulae'
	elog '   media-gfx/uniconvertor  - vector image format conversion'
	elog 'It can also use wordaxe for hyphenation, but this package is not'
	elog 'available in the portage tree yet. Please refer to the manual'
	elog "installed in /usr/share/doc/${PF}/ for more information."
}
