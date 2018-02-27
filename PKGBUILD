# Maintainer: Jguer <joaogg3 at gmail dot com>
pkgname=yay-bin
pkgver=3.373
pkgrel=1
pkgdesc="Yet another yogurt. Pacman wrapper and AUR helper written in go. Pre-compiled."
arch=('x86_64')
url="https://github.com/Jguer/yay"
license=('GPL')
depends=(
  'sudo'
)
provides=('yay')
conflicts=('yay' 'yay-git')

source_x86_64=("https://github.com/Jguer/yay/releases/download/v${pkgver}/${pkgname/-bin/}_${pkgver}_${CARCH}.tar.gz")
sha1sums_x86_64=('ca0020eec523b9e00a015eb6ed2727ef0fa7cbfd')

package() {
  _output="${srcdir}/${pkgname/-bin/}_${pkgver}_${CARCH}"
  install -Dm755 "${_output}/${pkgname/-bin/}" "${pkgdir}/usr/bin/${pkgname/-bin/}"

  # install -Dm644 "${_output}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname/-bin}/LICENSE"

  install -Dm644 "${_output}/yay.8" "${pkgdir}/usr/share/man/man8/yay.8"

  # Shell autocompletion script
  install -Dm644 "${_output}/bash-completion" "${pkgdir}/usr/share/bash-completion/completions/yay"

  install -Dm644 "${_output}/zsh-completion" "${pkgdir}/usr/share/zsh/site-functions/_yay"

  install -Dm644 "${_output}/yay.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/yay.fish"
}
