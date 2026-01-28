# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	aho-corasick@0.7.20
	android_system_properties@0.1.5
	autocfg@0.1.6
	binary-reader@0.4.5
	bitflags@1.3.2
	bumpalo@3.12.0
	byteorder@1.4.3
	bytes@0.4.12
	cc@1.0.79
	cfg-if@1.0.0
	chrono@0.4.24
	codespan-reporting@0.11.1
	core-foundation-sys@0.8.4
	cxx@1.0.94
	cxx-build@1.0.94
	cxxbridge-flags@1.0.94
	cxxbridge-macro@1.0.94
	dirs@4.0.0
	dirs-sys@0.3.7
	errno@0.3.0
	errno-dragonfly@0.1.2
	finder@0.1.6
	flexi_logger@0.25.3
	fnv@1.0.6
	font-reader@0.1.10
	getrandom@0.2.8
	glob@0.3.0
	hermit-abi@0.3.1
	http@0.1.18
	httparse@1.3.4
	iana-time-zone@0.1.56
	iana-time-zone-haiku@0.1.1
	io-lifetimes@1.0.10
	iovec@0.1.2
	is-terminal@0.4.6
	itoa@0.4.4
	itoa@1.0.6
	js-sys@0.3.61
	lazy_static@1.4.0
	libc@0.2.141
	libfonthelper@0.3.9
	link-cplusplus@1.0.8
	linux-raw-sys@0.3.1
	log@0.3.9
	log@0.4.17
	memchr@2.5.0
	nu-ansi-term@0.46.0
	num-integer@0.1.41
	num-traits@0.2.8
	num_cpus@1.10.1
	once_cell@1.17.1
	overload@0.1.1
	percent-encoding@2.2.0
	proc-macro2@1.0.53
	quote@1.0.26
	redox_syscall@0.1.56
	redox_syscall@0.2.16
	redox_users@0.4.3
	regex@1.7.2
	regex-syntax@0.6.29
	rustix@0.37.7
	ryu@1.0.0
	scoped_threadpool@0.1.9
	scratch@1.0.5
	serde@1.0.159
	serde_derive@1.0.159
	serde_json@1.0.95
	simple-server@0.4.0
	syn@1.0.109
	syn@2.0.8
	termcolor@1.2.0
	thiserror@1.0.40
	thiserror-impl@1.0.40
	time@0.1.42
	unicode-ident@1.0.8
	unicode-width@0.1.10
	wasi@0.11.0+wasi-snapshot-preview1
	wasm-bindgen@0.2.84
	wasm-bindgen-backend@0.2.84
	wasm-bindgen-macro@0.2.84
	wasm-bindgen-macro-support@0.2.84
	wasm-bindgen-shared@0.2.84
	winapi@0.2.8
	winapi@0.3.7
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-util@0.1.5
	winapi-x86_64-pc-windows-gnu@0.4.0
	windows@0.48.0
	windows-sys@0.45.0
	windows-sys@0.48.0
	windows-targets@0.42.2
	windows-targets@0.48.0
	windows_aarch64_gnullvm@0.42.2
	windows_aarch64_gnullvm@0.48.0
	windows_aarch64_msvc@0.42.2
	windows_aarch64_msvc@0.48.0
	windows_i686_gnu@0.42.2
	windows_i686_gnu@0.48.0
	windows_i686_msvc@0.42.2
	windows_i686_msvc@0.48.0
	windows_x86_64_gnu@0.42.2
	windows_x86_64_gnu@0.48.0
	windows_x86_64_gnullvm@0.42.2
	windows_x86_64_gnullvm@0.48.0
	windows_x86_64_msvc@0.42.2
	windows_x86_64_msvc@0.48.0
	xdg@2.4.1
"

inherit cargo systemd

DESCRIPTION="Font Helper for Figma on Linux - provides local font access to Figma web app"
HOMEPAGE="https://github.com/Figma-Linux/figma-linux-font-helper"
SRC_URI="
	https://github.com/Figma-Linux/figma-linux-font-helper/archive/v${PV}.tar.gz -> ${P}.tar.gz
	$(cargo_crate_uris ${CRATES})
"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="systemd"

DEPEND=""
RDEPEND="${DEPEND}
	!systemd? ( sys-apps/openrc )
	systemd? ( sys-apps/systemd )
"
BDEPEND="dev-lang/rust"

PATCHES=(
	"${FILESDIR}/${P}-protocol-v23.patch"
	"${FILESDIR}/figma-local-font-dir.patch"
	"${FILESDIR}/broken-pipe-crash.patch"
)

src_install() {
	# Install binary with proper name
	newbin "target/release/font_helper" figma-font-helper

	# Install init scripts based on USE flags
	if use systemd; then
		systemd_douserunit "${FILESDIR}/figma-font-helper.service"
	else
		newinitd "${FILESDIR}/figma-font-helper.initd" figma-font-helper
	fi

	# Install documentation
	dodoc README.md
}

pkg_postinst() {
	elog ""
	elog "IMPORTANT - Browser configuration required:"
	elog ""
	elog "1. Spoof user agent to Windows/macOS (Figma blocks Linux user agents)"
	elog "   Chrome: F12 > ⋮ > More tools > Network conditions"
	elog "   Set to 'Chrome - Windows' or 'Chrome - Mac'"
	elog ""
	elog "2. Allow 'Local Network Access' permission when Figma prompts"
	elog "   (Chrome 141+ security feature)"
	elog ""
	elog "3. Disable ad blockers for figma.com (they block localhost)"
}
