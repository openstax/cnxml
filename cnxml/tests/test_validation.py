# -*- coding: utf-8 -*-
from cnxml import validate_cnxml, validate_collxml


def test_validate_cnxml(datadir):
    errors = validate_cnxml(datadir / 'valid.cnxml')
    assert errors == tuple()


def test_validate_multiple_cnxml(datadir):
    datafile = datadir / 'valid.cnxml'
    errors = validate_cnxml(datafile, datafile)
    assert errors == tuple()


def test_cnxml_validation_messages(datadir):
    datafile = datadir / 'invalid.cnxml'
    expected = (
        [str(datafile), '30', '17', 'error', 'element "md:person" incomplete; missing required element "md:firstname"'],
        [str(datafile), '55', '20', 'error', 'element "md:subjectlist" incomplete; missing required element "md:subject"'],
        [str(datafile), '67', '11', 'error', 'element "para" missing required attribute "id"']
    )
    errors = validate_cnxml(datafile)
    assert tuple(list(l) for l in errors) == expected


def test_cnxml_multiple_validation_messages(datadir):
    bad_datafile = datadir / 'invalid.cnxml'
    good_datafile = datadir / 'valid.cnxml'
    expected = (
        [str(bad_datafile), '30', '17', 'error', 'element "md:person" incomplete; missing required element "md:firstname"'],
        [str(bad_datafile), '55', '20', 'error', 'element "md:subjectlist" incomplete; missing required element "md:subject"'],
        [str(bad_datafile), '67', '11', 'error', 'element "para" missing required attribute "id"']
    )
    errors = validate_cnxml(good_datafile, bad_datafile)
    assert tuple(list(l) for l in errors) == expected


def test_validate_collxml(datadir):
    errors = validate_collxml(datadir / 'valid_collection.xml')
    assert errors == tuple()


def test_collxml_validation_messages(datadir):
    datafile = datadir / 'invalid_collection.xml'
    expected = (
        [str(datafile), '47', '15', 'error',
            'element "cnx:para" not allowed here;'
            ' expected the element end-tag or element "module", "segue" or "subcollection"'],
        [str(datafile), '139', '18', 'error', 'element "col:collection" incomplete;'
            ' missing required element "metadata"']
    )

    errors = validate_collxml(datafile)
    assert tuple(list(l) for l in errors) == expected
