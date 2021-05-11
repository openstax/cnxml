.. Use the following to start a new version entry:

   |version|
   ----------------------

   - feature message

3.1.3
-----

- Support using document title once it is removed from metadata (#33)
- Remove some metadata unused by git storage (#32)

3.1.2
-----

- Update schema and add support for slug in metadata (#30)

3.1.1
-----

- Add support for new optional metadata (#28)

3.1.0
-----

- Relax required information when parsing metadata (#25)

3.0.1
-----

- Re-release of 3.0.0

3.0.0
-----

- Add tests for cnxml <md:derived-from ...> validation
- Fix failing derived-from cnxml validation tests
- Use a self-closing md:derived-from as the valid repr
- Move the metadata parsing from
  `Press <https://github.com/openstax/cnx-press>`_ to cnxml (#20)
- Add a CLI utility for extracting cnxml metadata to json (#22)

2.2.0
-----

- Extend validation API to accept multiple documents to validate

2.1.1
-----

- Tweak mdml schema to properly allow any metadata element under derived-from

2.1.0
-----

- Remove external pathlib dependency
- Drop support for Python <= 2.7
- Use versioneer for project versioning
- Correct license in setup.py
- Add instructions to validate with the atom.io editor

2.0.0
-----

- Add a commandline interface for collxml validation
- Rename main cli function to make room for another entrypoint
- Make the metadata section required in collxml
- Add collxml validation function

1.1.0
-----

- Use a namedtuple for validation error line data.

1.0.0
-----

- Initial release.
