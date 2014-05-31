base:
  '*':
    - base.autostate

  'roles:salt':
    - match: grain
    - base.gitsync
