# Maintainer: Jguer <joaogg3 at gmail dot com>
pkgname=yay-bin
pkgver=1.76
pkgrel=1
pkgdesc="Yet another yogurt. Pacman wrapper with AUR support written in go. Pre-compiled."
arch=('x86_64')
url="https://github.com/Jguer/yay"
license=('GPL')
depends=(
  'sudo'
)
provides=('yay')
conflicts=('yay')

source_x86_64=("https://github.com/Jguer/yay/releases/download/v${pkgver}/${pkgname/-bin}_${pkgver}_amd64.tar.gz")
md5sums_x86_64=('23abfa06ebc457cbed08019bddef4596')

case "$CARCH" in
  arm*) _pkgarch="arm"
	;;
  i686) _pkgarch="386"
	;;
  x86_64) _pkgarch="amd64"
	;;
esac

package() {
  install -Dm755 "${srcdir}/${pkgname/-bin}_${pkgver}_${_pkgarch}/${pkgname/-bin}" "${pkgdir}/usr/bin/${pkgname/-bin}"
  mkdir -p "${pkgdir}/usr/share/bash-completion/completions/"
  install -Dm644 "${srcdir}/${pkgname/-bin}_${pkgver}_${_pkgarch}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname/-bin}/LICENSE"

  # Shell autocompletion script
  mkdir -p "${pkgdir}/usr/share/bash-completion/completions/"
  install -Dm644 "${srcdir}/${pkgname/-bin}_${pkgver}_${_pkgarch}/bash-completion" "${pkgdir}/usr/share/bash-completion/completions/yay"

  mkdir -p "${pkgdir}/usr/share/zsh/site-functions/"
  install -Dm644 "${srcdir}/${pkgname/-bin}_${pkgver}_${_pkgarch}/zsh-completion" "${pkgdir}/usr/share/zsh/site-functions/_yay"

  mkdir -p "${pkgdir}/usr/share/fish/vendor_completions.d/"
  install -Dm644 "${srcdir}/${pkgname/-bin}_${pkgver}_${_pkgarch}/yay.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/yay.fish"

}
