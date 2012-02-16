# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

PEAR_PV="2.0.10"
PHP_PEAR_PKG_NAME="DoctrineBridge"

inherit php-pear-r1

DESCRIPTION="Symfony2 Doctrine Bridge"
HOMEPAGE="http://pear.symfony.com"
SRC_URI="http://pear.symfony.com/get/DoctrineBridge-2.0.10.tgz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=">=dev-lang/php-5.3.2
	>=dev-php/PEAR-PEAR-1.4.0"
RDEPEND="${DEPEND}"
