# -*- coding: utf-8 -*-
"""\
Validates CNXML and COLLXML

"""
from __future__ import print_function
import argparse
from pathlib import Path

from .validation import validate_cnxml, validate_collxml


def _format_error_line(error):
    """Formats the error line for human consumption"""
    return "{}:{} -- {}: {}".format(*error)


def print_errors(errors):
    """Print errors to stdout"""
    for err in errors:
        print(_format_error_line(err))


def _arg_parser():
    """Factory for creating the argument parser"""
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('xml')
    return parser


def cnxml(argv=None):
    args = _arg_parser().parse_args(argv)

    xml = Path(args.xml)

    errors = validate_cnxml(xml)
    print_errors(errors)

    retcode = errors and 1 or 0
    return retcode


def collxml(argv=None):
    args = _arg_parser().parse_args(argv)

    xml = Path(args.xml)

    errors = validate_collxml(xml)
    print_errors(errors)

    retcode = errors and 1 or 0
    return retcode
