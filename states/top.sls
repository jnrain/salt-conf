base:
  '*':
    - base.autostate
    - wheel
    - users

  'os:Gentoo':
    - match: grain
    - base.sanity.gentoo.base
    - portage.use

  'G@os:Gentoo and G@virtual:physical and not G@virtual_subtype:*':
    - match: compound
    - base.sanity.gentoo.physical

  'G@os:Gentoo and G@virtual:physical and not G@virtual_subtype:* and not G@roles:portagemirror':
    - match: compound
    - portage.sync

  'os:Ubuntu':
    - match: grain
    - base.sanity.ubuntu

  'G@os:Ubuntu and not G@roles:ubuntumirror':
    - match: compound
    - apt.sync

  'roles:salt':
    - match: grain
    - base.gitsync

  'roles:portagemirror':
    - match: grain
    - portage.mirror
