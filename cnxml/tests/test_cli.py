# -*- coding: utf-8 -*-
from cnxml.cli import main


def test_valid_cnxml(capsys, datadir):
    retcode = main([str(datadir / 'valid.cnxml')])
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

    retcode = main([str(datadir / 'invalid.cnxml')])
    out, err = capsys.readouterr()
    assert out.split('\n') == expected_out_lines
    assert err == ''
    assert retcode == 1
