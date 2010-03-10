# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit versionator

EAPI="2"

RDS_VERSION=$(get_version_component_range 1-2)
RDS_PATCHLEVEL=$(get_version_component_range 3)

MY_PV=${RDS_VERSION}.${RDS_PATCHLEVEL}
MY_PN=RDSCli

DESCRIPTION="Command line tools for Amazon's RDS Services"
HOMEPAGE="http://aws.amazon.com"
#SRC_URI="http://s3.amazonaws.com/rds-downloads/${MY_PN}-${RDS_VERSION}.${RDS_PATCHLEVEL}.zip"
SRC_URI="http://s3.amazonaws.com/rds-downloads/${MY_PN}.zip -> ${MY_PN}-${MY_PV}.zip"

S=${WORKDIR}/${MY_PN}-${MY_PV}

LICENSE="Amazon"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=">=virtual/jre-1.5
app-arch/unzip"

RDEPEND=""

src_unpack() {
	default
	cd "${WORKDIR}/${MY_PN}-${MY_PV}"
	find . -name *.cmd -exec rm {} \;
}

src_install() {
	dodir /opt/${PN}
	insinto /opt/${PN}/lib
	doins -r "${S}"/lib/*
	
	exeinto /opt/${PN}/bin
	doexe "${S}"/bin/*

	insinto /opt/${PN}/etc
	doins "${S}"/credential-file-path.template 

	dodir /etc/env.d
	cat - > "${T}"/98${PN} <<EOF
AWS_RDS_HOME=/opt/${PN}
export AWS_CREDENTIAL_FILE=/opt/${PN}/etc/credential-file-path.template
PATH=/opt/${PN}/bin
EOF
	doenvd "${T}"/98${PN}
}

pkg_postinst() {
	ewarn ""
	ewarn "Remember to run: env-update && source /etc/profile if you plan"
	ewarn "to use these tools in a shell before logging out (or restarting"
	ewarn "your login manager). Easiest just to open a new shell."

	einfo ""
	einfo "To set your AWS credentials edit:"
	einfo "/opt/${PN}/etc/credential-file-path.template"
}
