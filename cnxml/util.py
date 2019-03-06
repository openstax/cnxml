# -*- coding: utf-8 -*-
from pathlib import Path

import pkg_resources


__all__ = (
    'lookup_resource',
)


def lookup_resource(resource_path):
    return Path(pkg_resources.resource_filename('cnxml', resource_path))
