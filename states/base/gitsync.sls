5m-interval-gitsync:
  cron.present:
    - identifier: gitsync
    - name: 'cd /opt/jnrain-salt && git fetch origin && git reset -q --hard origin/master >> /var/log/salt/cron-gitsync.log 2>&1'
    - minute: '*/5'
