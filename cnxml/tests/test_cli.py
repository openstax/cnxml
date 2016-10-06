# -*- coding: utf-8 -*-
from cnxml.cli import cnxml, collxml


def test_valid_cnxml(capsys, datadir):
    retcode = cnxml([str(datadir / 'valid.cnxml')])
    out, err = capsys.readouterr()
    assert out == ''
    assert err == ''
    assert retcode == 0


def test_invalid_cnxml(capsys, datadir):
    expected_out_lines = [
        '30:17 -- error: unfinished element',
        '55:20 -- error: unfinished element',
        '67:11 -- error: required attributes missing',
        '',
    ]

    retcode = cnxml([str(datadir / 'invalid.cnxml')])
    out, err = capsys.readouterr()
    assert out.split('\n') == expected_out_lines
    assert err == ''
    assert retcode == 1


def test_valid_collxml(capsys, datadir):
    retcode = collxml([str(datadir / 'valid_collection.xml')])
    out, err = capsys.readouterr()
    assert out == ''
    assert err == ''
    assert retcode == 0


def test_invalid_collxml(capsys, datadir):
    expected_out_lines = [
        '47:15 -- error: element "para" from namespace '
        '"http://cnx.rice.edu/cnxml" not allowed in this context',
        '139:18 -- error: unfinished element',
        '',
    ]

    retcode = collxml([str(datadir / 'invalid_collection.xml')])
    out, err = capsys.readouterr()
    assert out.split('\n') == expected_out_lines
    assert err == ''
    assert retcode == 1
