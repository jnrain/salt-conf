# NTP server

{% set packages = salt['grains.filter_by']({
  'Gentoo': ['net-misc/ntp'],
  'Debian': ['ntp'],
  'default': 'Gentoo',
}) %}

{% set conf_path = salt['grains.filter_by']({
  'Gentoo': '/etc/ntp.conf',
  'default': 'Gentoo',
}) %}


ntpd-package:
  pkg.installed:
    - pkgs:
      {% for pkg in packages %}
      - {{ pkg }}
      {% endfor %}


ntpd-conf:
  file.managed:
    - name: {{ conf_path }}
    - source: salt://ntp/config/ntp.conf
    - template: jinja
    - mode: '0644'
    - user: root
    - group: root


ntpd-service:
  service:
    - running
    - name: ntpd
    - enable: true
    - require:
      - pkg: ntpd-package
      - file: ntpd-conf
    - watch:
      - file: ntpd-conf
