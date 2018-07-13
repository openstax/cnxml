# -*- coding: utf-8 -*-
from cnxml import validate_cnxml, validate_collxml


def test_validate_cnxml(datadir):
    errors = validate_cnxml(datadir / 'valid.cnxml')
    assert errors == tuple()


def test_cnxml_validation_messages(datadir):
    expected = (
        ['30', '17', 'error', 'element "md:person" incomplete; missing required element "md:firstname"'],
        ['55', '20', 'error', 'element "md:subjectlist" incomplete; missing required element "md:subject"'],
        ['67', '11', 'error', 'element "para" missing required attribute "id"']
    )
    errors = validate_cnxml(datadir / 'invalid.cnxml')
    assert tuple(list(l) for l in errors) == expected


def test_validate_collxml(datadir):
    errors = validate_collxml(datadir / 'valid_collection.xml')
    assert errors == tuple()


def test_collxml_validation_messages(datadir):
    expected = (
        ['47', '15', 'error',
            'element "cnx:para" not allowed here;'
            ' expected the element end-tag or element "module", "segue" or "subcollection"'],
        ['139', '18', 'error', 'element "col:collection" incomplete;'
            ' missing required element "metadata"']
    )

    errors = validate_collxml(datadir / 'invalid_collection.xml')
    assert tuple(list(l) for l in errors) == expected
