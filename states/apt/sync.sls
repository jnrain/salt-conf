# apt-get sync settings for non-mirror nodes.
12h-interval-apt-sync-slave:
  cron.present:
    - identifier: apt-sync-slave
    - name: 'apt-get update -qq > /var/log/salt/cron-apt-sync.log 2>&1'
    - minute: '12'  # halfway between the scheduled Portage syncs
    - hour: '6,18'
