# NTP client config for Ubuntu nodes
time-sync-ubuntu:
  pkg.installed:
    - pkgs:
      - ntpdate

  cron.present:
    - identifier: ntpdate
    - name: 'ntpdate ntp.jnrain.org > /var/log/salt/cron-ntpdate.log 2>&1'
    - hour: '*/2'
