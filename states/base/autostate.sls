# taken from pypa/pypa-salt
15m-interval-highstate:
  cron.present:
    - identifier: highstate
    - name: salt-call state.highstate >> /var/log/salt/cron-highstate.log 2>&1
    - minute: '*/15'

/etc/logrotate.d/salt:
  file.managed:
    - source: salt://base/config/salt-logrotate.conf
