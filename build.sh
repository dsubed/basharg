#!/bin/bash
PROJECT_NAME=basharg

# Fetch version from version file
RPM_VERSION=$(<./version)

#setting up the build environment
TOP_DIR=`pwd`/rpmbuild
SOURCE_DIR=$TOP_DIR/SOURCES/
TARGET=$TOP_DIR/RPMS

mkdir -p $TOP_DIR
rm -rf $TOP_DIR
mkdir -p $SOURCE_DIR
mkdir -p output

#copy the source files to the SOURCES directory
cp -r ./src $SOURCE_DIR/

rpmbuild --define="_topdir $TOP_DIR"  --define="_sourcedir $SOURCE_DIR" --define="version $RPM_VERSION" -bb ./$PROJECT_NAME.spec
# move the generated rpm files to the output directory
find $TOP_DIR/RPMS -name "*.rpm" -exec mv {} output/ \;
