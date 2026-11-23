# -*- coding: utf-8 -*-
from pathlib import Path

from importlib.resources import files


__all__ = (
    'lookup_resource',
)


def lookup_resource(resource_path):
    return Path(str(files('cnxml').joinpath(resource_path)))
