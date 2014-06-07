# Sanity for Ubuntu nodes
# Heavily based on the pypa-salt project.

ubuntu-niceties:
  pkg.installed:
    - pkgs:
      - htop
      - tmux
      - tree
      - bash-completion
      - vim
      - mosh

no-ubuntu-user:
  user.absent:
    - name: ubuntu
    - purge: True
