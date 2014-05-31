#!/usr/bin/env python
# -*- coding: utf-8 -*-

from __future__ import unicode_literals

import salt.utils

# hack used by salt.grains.core
import salt.modules.cmdmod

__salt__ = {
        'cmd.run': salt.modules.cmdmod._run_quiet,
        }


def gentoo_arch():
    '''Workaround for Salt not natively supporting osarch for Gentoo.

    This implements the logic found in the eselect package, namely that in
    ``/usr/share/eselect/libs/package-manager.bash``. Only Portage is
    supported at present.

    '''

    portageq = salt.utils.which('portageq')
    if not portageq:
        return {}

    try:
        envvar_ARCH = __salt__['cmd.run']('portageq envvar ARCH').strip()
        return {'gentooarch': envvar_ARCH, }
    except OSError:
        return {}


# vim:set ai et ts=4 sw=4 sts=4 fenc=utf-8:
