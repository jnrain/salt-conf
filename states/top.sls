base:
  '*':
    - base.autostate

  'os:Ubuntu':
    - match: grain
    - base.sanity.ubuntu

  'roles:salt':
    - match: grain
    - base.gitsync
