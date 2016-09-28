# -*- coding: utf-8 -*-
from pathlib import Path

import pkg_resources


__all__ = (
    'CNXML_JING_RNG',
    'jing',
    'validate_cnxml',
    )


CNXML_JING_RNG = Path(pkg_resources.resource_filename(
    'cnxml',
    'xml/cnxml/schema/rng/0.7/cnxml-jing.rng'))


def jing(rng_filepath, xml_filepath):
    """Run jing.jar using the RNG file against the given XML file."""
    # TODO Call `java -jar jing.jar $rng $xml`
    return ()


def validate_cnxml(content_filepath):
    """Validates the given CNXML file against the cnxml-jing.rng RNG."""
    content_filepath = Path(content_filepath).resolve()
    return jing(CNXML_JING_RNG, content_filepath)
