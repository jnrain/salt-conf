# Portage sync settings for non-mirror nodes.
12h-interval-portage-sync-slave:
  cron.present:
    - identifier: portage-sync-slave
    - name: 'eix-sync -q -C --ask -C n > /var/log/salt/cron-eix-sync.log 2>&1'
    - minute: '17'  # 10 min after start of mirror node sync
    - hour: '6,18'
