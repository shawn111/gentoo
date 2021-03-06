# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit eutils qmake-utils

MY_PN=ColorCode
DESCRIPTION="A free advanced MasterMind clone"
HOMEPAGE="http://colorcode.laebisch.com/"
SRC_URI="http://${PN}.laebisch.com/download/${MY_PN}-${PV}.tar.gz"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-qt/qtcore:5
	dev-qt/qtgui:5
	dev-qt/qtwidgets:5
"
RDEPEND="${DEPEND}"

S=${WORKDIR}/${MY_PN}-${PV}

src_prepare() {
	default
	sed -i -e '/FLAGS/d' ${PN}.pro || die
}

src_configure() {
	eqmake5
}

src_install() {
	dobin ${PN}
	newicon img/cc64.png ${PN}.png
	make_desktop_entry ${PN} ${MY_PN}
}
