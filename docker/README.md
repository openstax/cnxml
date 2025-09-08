# Howto

## Generate the schema

Run `./docker/poet-schema generate-schema` with an optional `--branch` option pointing to specific branch.

This command will do the following:

1. Build docker image with all the tools you need
2. Initialize the poet repository in this repository's root directory
3. Generate the combined schema with jing
4. Convert the combined schema to xsd with trang
5. Apply the schema patch

## Create a new schema patch

Run `./docker/poet-schema generate-schema` with `--unpatched` and an optional `--branch` option pointing to specific branch.

This command will do the following:

1. Everything to generate the schema except for applying the patch
2. Create a new commit for the unpatched version of the schema
3. Checkout the previous patched version

Next, you should:

1. Make whatever changes you need to in the xsd files
2. Run `./docker/poet-schema generate-patch`

This will create an updated patch file with all the changes from the previous patch plus your new changes. From here, you should copy the patch and xsd files into your regular poet workspace/repository (maybe something like `cp ./poet/client/static/xsd/* ../poet/client/static/xsd/.` depending on where your normal poet workspace is located.)

The person who wrote this would usually open the local poet repository in vscode/codium and revert hunks visually. Something like `git checkout --patch` could also work. Remember that the changes you leave behind are the ones used to create the patch: only revert the hunks that removed your schema changes. Depending on what you're changing, you might also need to make manual edits.

If generating the patch does not create a diff, then you should double check that your changes were included in the rng schema file as expected. You might have also missed reverting a hunk or something like that.

You can test this new patch file by pushing it to a branch and running `./docker/poet-schema generate-schema --branch <your-branch>`. If all is well, the patch should apply without rejections and your changes should be in there.

