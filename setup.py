# -*- coding: utf-8 -*-
from setuptools import setup, find_packages
import versioneer


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
with open('README.rst', 'r') as readme, open('CHANGES.rst', 'r') as changes:
    readme_info = readme.read()
    changelog = changes.read()
    long_description = '\n\n'.join([readme_info,
                                    "Change Log\n==========",
                                    changelog])


setup(
    name='cnxml',
    version=versioneer.get_version(),
    author='Connexions team',
    author_email='info@cnx.org',
    url="https://github.com/connexions/cnxml",
    license='AGPL, See also LICENSE.txt',
    description=description,
    long_description=long_description,
    setup_requires=setup_requires,
    install_requires=install_requires,
    tests_require=tests_require,
    extras_require=extras_require,
    test_suite='cnxml.tests',
    packages=find_packages(),
    include_package_data=True,
    cmdclass=versioneer.get_cmdclass(),
    package_data={
        'cnxml.tests': ['data/**/*.*'],
        },
    entry_points="""\
    [console_scripts]
    validate-cnxml = cnxml.cli:cnxml
    validate-collxml = cnxml.cli:collxml
    """,
    )
