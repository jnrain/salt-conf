/etc/profile:
  file.managed:
    - source: salt://conf/etc/profile
    - mode: 644
    - user: root
    - group: root

app-shells/bash-completion:
  pkg:
    - latest
