# -*- coding: utf-8 -*-
from cnxml.cli import cnxml, collxml


def test_valid_cnxml(capsys, datadir):
    retcode = cnxml([str(datadir / 'valid.cnxml')])
    out, err = capsys.readouterr()
    assert out == ''
    assert err == ''
    assert retcode == 0


def test_invalid_cnxml(capsys, datadir):
    datafile = str(datadir / 'invalid.cnxml')
    expected_out_lines = [
        '{}:30:17 -- error: element "md:person" incomplete;'
        ' missing required element "md:firstname"'.format(datafile),
        '{}:55:20 -- error: element "md:subjectlist" incomplete;'
        ' missing required element "md:subject"'.format(datafile),
        '{}:67:11 -- error: element "para"'
        ' missing required attribute "id"'.format(datafile)
    ]

    retcode = cnxml([datafile])
    out, err = capsys.readouterr()
    assert out.splitlines() == expected_out_lines
    assert err == ''
    assert retcode == 1


def test_valid_collxml(capsys, datadir):
    retcode = collxml([str(datadir / 'valid_collection.xml')])
    out, err = capsys.readouterr()
    assert out == ''
    assert err == ''
    assert retcode == 0


def test_invalid_collxml(capsys, datadir):
    datafile = str(datadir / 'invalid_collection.xml')
    expected_out_lines = [
        '{}:47:15 -- error: element "cnx:para" not allowed here;'
        ' expected the element end-tag or element'
        ' "module", "segue" or "subcollection"'.format(datafile),
        '{}:139:18 -- error: element "col:collection" incomplete;'
        ' missing required element "metadata"'.format(datafile)
    ]

    retcode = collxml([datafile])
    out, err = capsys.readouterr()
    assert out.splitlines() == expected_out_lines
    assert err == ''
    assert retcode == 1
