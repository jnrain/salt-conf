# Sanity for Gentoo nodes

necessities:
  pkg.installed:
    - pkgs:
      - sys-process/cronie
      - app-admin/sudo
      - app-portage/eix
      - app-shells/bash-completion
      - net-misc/mosh
