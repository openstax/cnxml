# -*- coding: utf-8 -*-
from pathlib import Path

from .jing import jing
from .util import lookup_resource

__all__ = (
    'CNXML_JING_RNG',
    'COLLXML_JING_RNG',
    'validate_cnxml',
    'validate_collxml',
)


CNXML_JING_RNG = lookup_resource('xml/cnxml/schema/rng/0.7/cnxml-jing.rng')
COLLXML_JING_RNG = lookup_resource(
    'xml/collxml/schema/rng/2.0/collxml-jing.rng')


def validate_cnxml(*content_filepaths):
    """Validates the given CNXML file against the cnxml-jing.rng RNG."""
    content_filepaths = [Path(path).resolve() for path in content_filepaths]
    return jing(CNXML_JING_RNG, *content_filepaths)


def validate_collxml(*content_filepaths):
    """Validates the given COLLXML file against the collxml-jing.rng RNG."""
    content_filepaths = [Path(path).resolve() for path in content_filepaths]
    return jing(COLLXML_JING_RNG, *content_filepaths)
