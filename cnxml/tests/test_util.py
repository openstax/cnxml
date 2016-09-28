# -*- coding: utf-8 -*-
import pkg_resources


def test_resource_lookup():
    resource = 'jing.jar'
    expected_filepath = pkg_resources.resource_filename('cnxml', resource)
    from cnxml.util import lookup_resource
    filepath = lookup_resource(resource)
    assert expected_filepath == str(filepath.resolve())
