# Time sync for physical nodes, as LXC nodes don't need (and can't execute)
# these.
time-sync-gentoo:
  pkg.installed:
    - pkgs:
      - net-misc/ntp

  cron.present:
    - identifier: ntpdate
    - name: 'ntpdate ntp.jnrain.org > /var/log/salt/cron-ntpdate.log 2>&1'
    - hour: '*/2'
