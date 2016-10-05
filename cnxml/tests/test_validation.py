# -*- coding: utf-8 -*-
from cnxml import validate_cnxml, validate_collxml


def test_validate_cnxml(datadir):
    errors = validate_cnxml(datadir / 'valid.cnxml')
    assert errors == tuple()


def test_cnxml_validation_messages(datadir):
    expected = (
        ['30', '17', 'error', 'unfinished element'],
        ['55', '20', 'error', 'unfinished element'],
        ['67', '11', 'error', 'required attributes missing'],
    )
    errors = validate_cnxml(datadir / 'invalid.cnxml')
    assert tuple(list(l) for l in errors) == expected


def test_validate_collxml(datadir):
    errors = validate_collxml(datadir / 'valid_collection.xml')
    assert errors == tuple()


def test_collxml_validation_messages(datadir):
    expected = (
        ['47', '15', 'error',
         'element "para" from namespace '
         '"http://cnx.rice.edu/cnxml" not allowed in this context'],
        ['139', '18', 'error', 'unfinished element'],
    )
    errors = validate_collxml(datadir / 'invalid_collection.xml')
    assert tuple(list(l) for l in errors) == expected
