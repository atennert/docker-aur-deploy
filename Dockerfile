# This image has been created to update AUR resources. It complies with the requirements for Circle CI primary images.

# Archlinux as base
FROM archlinux:base-devel-20210808.0.31089

# Update the SW in the container
RUN pacman -Syu --noconfirm
# install required packages
RUN pacman -S --noconfirm pacman-contrib bash git openssh tar gzip ca-certificates

# switch to a non-root user
RUN useradd --shell=/bin/bash --create-home ci && passwd -d ci
USER ci
WORKDIR /home/ci

# register AUR as known host
RUN mkdir /home/ci/.ssh
RUN ssh-keyscan aur.archlinux.org > /home/ci/.ssh/known_hosts