base:
  '*':
    - base.autostate

  'os:Gentoo':
    - match: grain
    - base.sanity.gentoo.base

  'G@os:Gentoo and G@virtual:physical and not G@virtual_subtype:*':
    - match: compound
    - base.sanity.gentoo.physical

  'os:Ubuntu':
    - match: grain
    - base.sanity.ubuntu

  'roles:salt':
    - match: grain
    - base.gitsync
