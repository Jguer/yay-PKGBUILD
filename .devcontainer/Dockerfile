FROM --platform=linux/amd64 archlinux@sha256:c84ad63503efc5d386e30a5f44945fa8eee10fcb21b3d5fceda260783de394ff
LABEL maintainer="Jguer,docker@jguer.space"

ENV GO111MODULE=on

# Disable pacman's landlock/seccomp sandbox: it doesn't work inside BuildKit.
# asciidoc, doxygen, meson needed for pacman-git.
RUN set -eux; \
    sed -i 's/^#\?DisableSandbox.*/DisableSandbox/' /etc/pacman.conf || true; \
    sed -i 's/^#\?DownloadUser.*/#DownloadUser = alpm/' /etc/pacman.conf || true; \
    pacman -Syu --noconfirm --needed \
        pacman-contrib aurpublish zsh git-delta openssh bat go github-cli \
        archlinux-keyring git gcc make sudo asciidoc doxygen meson curl; \
    rm -rf /var/lib/pacman/sync/* /var/cache/pacman/* /tmp/* /var/tmp/*; \
    rm -rf /usr/share/man/* /usr/share/doc/* || true

# Non-root user with passwordless sudo
RUN useradd -m -s /bin/bash docker \
    && echo "docker ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/docker

USER docker

WORKDIR /workspace

CMD ["zsh"]
