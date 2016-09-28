# -*- coding: utf-8 -*-


def test_validate_cnxml(datadir):
    from cnxml import validate_cnxml
    errors = validate_cnxml(datadir / 'valid.cnxml')
    assert errors == tuple()


def test_cnxml_validation_messages(datadir):
    from cnxml import validate_cnxml
    expected = (
        ['30', '17', 'error', 'unfinished element'],
        ['55', '20', 'error', 'unfinished element'],
        ['67', '11', 'error', 'required attributes missing'],
    )
    errors = validate_cnxml(datadir / 'invalid.cnxml')
    assert errors == expected
