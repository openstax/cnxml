# -*- coding: utf-8 -*-
import sys
from setuptools import setup, find_packages


IS_PY3 = sys.version_info > (3,)

setup_requires = (
    'pytest-runner',
    )
install_requires = (
    )
tests_require = [
    'pytest',
    ]
extras_require = {
    'test': tests_require,
    }
description = "Connexions CNXML Library"
with open('README.rst', 'r') as readme:
    long_description = readme.read()

if not IS_PY3:
    pass
    # tests_require.append('mock==1.0.1')

setup(
    name='cnxml',
    version='0.0.0',
    author='Connexions team',
    author_email='info@cnx.org',
    url="https://github.com/connexions/cnxml",
    license='LGPL, See also LICENSE.txt',
    description=description,
    long_description=long_description,
    setup_requires=setup_requires,
    install_requires=install_requires,
    tests_require=tests_require,
    extras_require=extras_require,
    test_suite='cnxml.tests',
    packages=find_packages(),
    include_package_data=True,
    package_data={
        'cnxml.tests': ['data/**/*.*'],
        },
    entry_points="""\
    """,
    )
