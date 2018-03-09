#!/bin/sh

# Keep this version updated to the latest release (would be super nice
# to do this automatically with the github api!)
VERSION=0.6.0

pushd docs

echo "Running hugo"
hugo

popd

echo "Removing old site"
rm -rf dist/$VERSION

echo "Moving new site into dist"
mv docs/public dist/$VERSION

echo "Making latest symlink"
cd dist
rm -f latest
ln -s $VERSION latest