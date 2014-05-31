base:
  '*':
    - base.autostate

  'os:Gentoo':
    - match: grain
    - base.sanity.gentoo

  'os:Ubuntu':
    - match: grain
    - base.sanity.ubuntu

  'roles:salt':
    - match: grain
    - base.gitsync
