# -*- coding: utf-8 -*-
import subprocess
from collections import namedtuple

from .util import lookup_resource

__all__ = (
    'jing',
    'ErrorLine',
)


JING_JAR = lookup_resource('jing.jar')

# This will map fatal messages to something human readable.
KNOWN_FATAL_MESSAGES_MAPPING = {
    'exception "java.io.IOException" thrown: Stream closed.':
    'DOCTYPE declaration not allowed',
}


ErrorLine = namedtuple('ErrorLine', 'line, column, type, message')


def _parse_jing_line(line):
    """Parse a line of jing output to a list of line, column, type
    and message.

    """
    parts = line.split(':', 4)
    line, column, type_, message = [x.strip() for x in parts[1:]]
    if type_ == 'fatal':
        if message in KNOWN_FATAL_MESSAGES_MAPPING:
            message = KNOWN_FATAL_MESSAGES_MAPPING[message]
    return ErrorLine(line, column, type_, message)


def _parse_jing_output(output):
    """Parse the jing output into a tuple of line, column, type and message.

    """
    output = output.strip()
    values = [_parse_jing_line(l) for l in output.split('\n') if l]
    return tuple(values)


def jing(rng_filepath, xml_filepath):
    """Run jing.jar using the RNG file against the given XML file."""
    cmd = ['java', '-jar']
    cmd.extend([str(JING_JAR), '-i', str(rng_filepath), str(xml_filepath)])
    proc = subprocess.Popen(cmd,
                            stdin=subprocess.PIPE,
                            stdout=subprocess.PIPE,
                            stderr=subprocess.PIPE,
                            close_fds=True)
    out, err = proc.communicate()
    return _parse_jing_output(out.decode('utf-8'))
