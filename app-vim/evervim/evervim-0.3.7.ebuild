# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

#VIM_PLUGIN_VIM_VERSION="7.0"
inherit vim-plugin

DESCRIPTION="evervim let's you edit EverNote notes from vim"
HOMEPAGE="https://github.com/kakkyz81/evervim"
LICENSE=""
KEYWORDS="~amd64 ~x86"
IUSE=""
SRC_URI="https://github.com/kakkyz81/evervim/tarball/ver.0.3.7 -> ${PF}.tar.gz"

VIM_PLUGIN_HELPFILES="evervim"
VIM_PLUGIN_HELPTEXT=""
VIM_PLUGIN_HELPURI=""
VIM_PLUGIN_MESSAGES=""

RDEPEND="${DEPEND}
	app-editors/vim[python]
	dev-python/markdown"

S=${WORKDIR}/kakkyz81-evervim-835551d

pkg_postinst() {
	elog "To complete installation, get a developer token from"
	elog "Evernote Web (https://www.evernote.com/api/DeveloperToken.action) and"
	elog "add it to your vimrc using variable g:evervim_devtoken"
	elog ""
	elog "let g:evervim_devtoken='<Your dev token>'"
	elog ""
	elog "Then run :EvervimSetup to complete installation"
	elog ""
	elog ":help evervim For usage instructions"
	elog ""
}
