base:
  '*':
    - base.autostate
    - wheel
    - users

  # 基础配置
  'os:Gentoo':
    - match: grain
    - base.sanity.gentoo.base
    - portage.use

  'os:Ubuntu':
    - match: grain
    - base.sanity.ubuntu.base

  # 定时同步物理 Gentoo 节点的 Portage 树
  'G@os:Gentoo and G@virtual:physical and not G@virtual_subtype:* and not G@roles:portagemirror':
    - match: compound
    - portage.sync

  # 定时同步 Ubuntu 软件仓库
  'G@os:Ubuntu and not G@roles:ubuntumirror':
    - match: compound
    - apt.sync

  # Salt master 配置数据同步
  'roles:salt':
    - match: grain
    - base.gitsync

  # Portage 镜像节点
  'roles:portagemirror':
    - match: grain
    - portage.mirror

  # NTP 配置, 重点是不要让担任 NTP 服务器角色的节点 (跟自己) 同步时间,
  # 也不要让 LXC 虚拟容器同步时间. (VMWare 之类的平台虚拟化方案倒是可以同步)
  'roles:ntpserver':
    - match: grain
    - ntp.server

  'G@os:Gentoo and not G@virtual_subtype:LXC and not G@roles:ntpserver':
    - match: compound
    - base.sanity.gentoo.ntpdate

  'G@os:Ubuntu and not G@virtual_subtype:LXC and not G@roles:ntpserver':
    - match: compound
    - base.sanity.ubuntu.ntpdate
