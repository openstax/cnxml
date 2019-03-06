# -*- coding: utf-8 -*-
from pathlib import Path

import pytest


here = Path(__file__).parent
DATA_DIR = here / 'data'


@pytest.fixture(scope='session')
def datadir():
    """Returns the path to the data directory"""
    return DATA_DIR
