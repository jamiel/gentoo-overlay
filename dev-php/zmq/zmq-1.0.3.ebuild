# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

PHP_EXT_NAME="zmq"
PHP_EXT_INI="yes"
PHP_ZEND_EXTENSION="no"

inherit php-ext-source-r2

DESCRIPTION="PHP extension for 0MQ messaging system"
HOMEPAGE="http://www.zeromq.org/bindings:php"
SRC_URI="http://pear.zero.mq/get/zmq-1.0.3.tgz"

LICENSE=""
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="net-libs/zeromq"
RDEPEND=""

