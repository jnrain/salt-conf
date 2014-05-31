# Portage mirror node settings
portage-mirror:
  pkg.installed:
    - pkgs:
      - net-misc/rsync

  cron.present:
    - identifier: portage-sync-mirror
    - name: 'eix-sync -q -C --ask -C n > /var/log/salt/cron-eix-sync.log 2>&1'
    - minute: '7'
    - hour: '6,18'

/etc/conf.d/rsyncd:
  file.managed:
    - source: salt://portage/config/mirror/conf.d/rsyncd
    - mode: 644
    - user: root
    - group: root

/etc/rsyncd.conf:
  file.managed:
    - source: salt://portage/config/mirror/rsyncd.conf
    - mode: 644
    - user: root
    - group: root

rsyncd:
  service:
    - running
    - enable: true
    - watch:
      - file: /etc/rsyncd.conf
      - file: /etc/conf.d/rsyncd
    - require:
      - file: /etc/rsyncd.conf
      - file: /etc/conf.d/rsyncd
      - pkg: net-misc/rsync
