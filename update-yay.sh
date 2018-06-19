#!/usr/bin/bash

# Usage Function
function usage() {
  cat <<_EOT_
Usage:
  $0 version ...
Description:
  version tells what pkgver to update to
_EOT_
  exit 1
}

if [ $# = 0 ]; then
  usage
fi

newV="$1"
echo "Processing yay"
(
  cd yay || exit
  git checkout .
  git clean -fdx
  git pull
  sed -i "s/pkgver=.*/pkgver=$newV/g" PKGBUILD
  updpkgsums PKGBUILD
  makepkg
  makepkg --printsrcinfo >.SRCINFO
  git commit -a -S -m "$newV"
  # git push
)

echo "Processing yay-bin"
(
  cd yay-bin || exit
  git checkout .
  git clean -fdx
  git pull
  sed -i "s/pkgver=.*/pkgver=$newV/g" PKGBUILD
  updpkgsums PKGBUILD
  makepkg
  makepkg --printsrcinfo >.SRCINFO
  git commit -a -S -m "$newV"
  # git push
)

echo "Processing yay-git"
(
  cd yay-git || exit
  git checkout .
  git clean -fdx
  git pull
  makepkg
  makepkg --printsrcinfo >.SRCINFO
  git commit -a -S -m "$newV"
  # git push
)
