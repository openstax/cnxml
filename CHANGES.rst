.. Use the following to start a new version entry:

   |version|
   ----------------------

   - feature message

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
