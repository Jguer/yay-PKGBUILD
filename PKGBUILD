# Maintainer: Jguer <joaogg3 at gmail dot com>
pkgname=yay-bin
pkgver=8.998
pkgrel=1
pkgdesc="Yet another yogurt. Pacman wrapper and AUR helper written in go. Pre-compiled."
arch=('x86_64')
url="https://github.com/Jguer/yay"
license=('GPL')
depends=(
  'pacman>=5.1'
  'sudo'
  'git'
)
provides=('yay')
conflicts=('yay' 'yay-git')

source_x86_64=("https://github.com/Jguer/yay/releases/download/v${pkgver}/${pkgname/-bin/}_${pkgver}_${CARCH}.tar.gz")
sha1sums_x86_64=('b06693b0a078f4cee2725ca0e89f1a212fae1eea')

package() {
  _output="${srcdir}/${pkgname/-bin/}_${pkgver}_${CARCH}"
  install -Dm755 "${_output}/${pkgname/-bin/}" "${pkgdir}/usr/bin/${pkgname/-bin/}"
  install -Dm644 "${_output}/yay.8" "${pkgdir}/usr/share/man/man8/yay.8"

  # Shell autocompletion script
  install -Dm644 "${_output}/bash" "${pkgdir}/usr/share/bash-completion/completions/yay"
  install -Dm644 "${_output}/zsh" "${pkgdir}/usr/share/zsh/site-functions/_yay"
  install -Dm644 "${_output}/fish" "${pkgdir}/usr/share/fish/vendor_completions.d/yay.fish"
}
