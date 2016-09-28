# -*- coding: utf-8 -*-
from pathlib import Path


here = Path(__file__).parent
DATA_DIR = here / 'data'


def test_validate_cnxml():
    from cnxml import validate_cnxml
    errors = validate_cnxml(DATA_DIR / 'valid.cnxml')
    assert errors == tuple()


def test_cnxml_validation_messages():
    from cnxml import validate_cnxml
    expected = (
        ['30', '17', 'error', 'unfinished element'],
        ['55', '20', 'error', 'unfinished element'],
        ['67', '11', 'error', 'required attributes missing'],
    )
    errors = validate_cnxml(DATA_DIR / 'invalid.cnxml')
    assert errors == expected
