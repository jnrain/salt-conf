# Sanity for Ubuntu nodes
# Heavily based on the pypa-salt project.

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
      - ntpdate

  cron.present:
    - identifier: ntpdate
    - name: 'ntpdate ntp.jnrain.org > /var/log/salt/cron-ntpdate.log 2>&1'
    - hour: '*/2'

ubuntu:
  user.absent:
    - purge: True
