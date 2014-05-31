# Sanity for Gentoo nodes

gentoo-necessities:
  pkg.installed:
    - pkgs:
      - sys-process/cronie
      - app-admin/sudo
      - app-portage/eix
      - app-shells/bash-completion
      - net-misc/mosh
