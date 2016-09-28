# -*- coding: utf-8 -*-
from pathlib import Path


here = Path(__file__).parent
DATA_DIR = here / 'data'


def test_validate_cnxml():
    from cnxml import validate_cnxml
    errors = validate_cnxml(DATA_DIR / 'valid.cnxml')
    assert errors == tuple()
