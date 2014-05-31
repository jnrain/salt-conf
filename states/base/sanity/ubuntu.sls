# Sanity for Ubuntu nodes
# This is directly copied from the pypa-salt project.

niceties:
  pkg.installed:
    - pkgs:
      - htop
      - tmux
      - tree
      - bash-completion
      - vim
      - mosh

time-sync:
  pkg.installed:
    - pkgs:
      - ntp
      - ntpdate

ntp:
  service:
    - running
    - enable: True

ubuntu:
  user.absent:
    - purge: True
