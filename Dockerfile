# updates the sources in AUR

# Archlinux as base
FROM archlinux:base-devel-20210808.0.31089

# Update the SW in the container
RUN pacman -Syu --noconfirm
# install required packages
RUN pacman -S --noconfirm pacman-contrib bash git openssh tar gzip ca-certificates

RUN useradd --shell=/bin/bash --create-home ci && passwd -d ci

USER ci
WORKDIR /home/ci

# register AUR as known host
RUN mkdir /home/ci/.ssh
RUN echo "aur.archlinux.org,2a01:4f9:c010:50::1 ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBLMiLrP8pVi5BFX2i3vepSUnpedeiewE5XptnUnau+ZoeUOPkpoCgZZuYfpaIQfhhJJI5qgnjJmr4hyJbe/zxow=" > /home/ci/.ssh/known_hosts
