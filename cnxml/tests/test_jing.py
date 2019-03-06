# -*- coding: utf-8 -*-
from pathlib import Path

from cnxml.jing import _parse_jing_line, _parse_jing_output, jing, ErrorLine


here = Path(__file__).parent
JING_TEST_DIR = here / 'data' / 'jing'


def test_line_parsing():
    line = '/home/fred/broken.cnxml:30:17: error: unfinished element'
    expected = ErrorLine('/home/fred/broken.cnxml', '30', '17', 'error', 'unfinished element')
    assert _parse_jing_line(line) == expected


def test_parse_fatal_doctype_line():
    line = '/home/fred/broken.cnxml:1:1: fatal: exception "java.io.IOException" thrown: Stream closed.'
    expected = ErrorLine('/home/fred/broken.cnxml', '1', '1', 'fatal', 'DOCTYPE declaration not allowed')
    assert _parse_jing_line(line) == expected


def test_parse_output():
    lines = """\
/home/fred/broken.cnxml:30:17: error: unfinished element
/home/fred/broken.cnxml:55:20: error: unfinished element
/home/fred/broken.cnxml:67:11: error: required attributes missing
"""
    expected = (
        ErrorLine('/home/fred/broken.cnxml', '30', '17', 'error', 'unfinished element'),
        ErrorLine('/home/fred/broken.cnxml', '55', '20', 'error', 'unfinished element'),
        ErrorLine('/home/fred/broken.cnxml', '67', '11', 'error', 'required attributes missing'),
    )
    assert _parse_jing_output(lines) == expected


def test_jing_call_valid_xml():
    rng = JING_TEST_DIR / 'test.rng'
    xml = JING_TEST_DIR / 'valid.xml'
    assert jing(rng, xml) == ()


def test_jing_call_invalid_xml():
    rng = JING_TEST_DIR / 'test.rng'
    xml = JING_TEST_DIR / 'invalid.xml'
    expected = (ErrorLine(str(xml), '1', '7', 'error', 'element "c" not allowed anywhere; expected the element end-tag or element "b"'),)
    assert jing(rng, xml) == expected
