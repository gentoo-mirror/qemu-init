# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EGIT_REPO_URI="git://git.overlays.gentoo.org/proj/kvm-tools.git"
inherit git-2

DESCRIPTION="Kvm and qemu init scripts"
SRC_URI=''
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"

PDEPEND="|| ( app-emulation/qemu-kvm app-emulation/qemu )"

src_install() {
	newinitd "${FILESDIR}"/qemu-init-script qemu
	newconfd "${FILESDIR}"/qemu-conf.example qemu.conf.example
	newsbin "${FILESDIR}"/qtap-manipulate qtap-manipulate
	dosym qemu /etc/init.d/kvm
}
