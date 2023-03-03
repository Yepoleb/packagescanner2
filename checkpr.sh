#!/bin/bash

set -e

sourceRepository="https://github.com/PhilippMDoerner/packages"
sourceBranch="add-lowdb1755"
targetRepository="https://github.com/nim-lang/packages"
targetBranch="master"

rm -rf temprepo
mkdir temprepo
cd temprepo
git init
git fetch "$sourceRepository" "$sourceBranch:newpackage"
git fetch "$targetRepository" "$targetBranch:base"
git checkout newpackage
cp packages.json packages_new.json
# Get packages.json at the branching point
git checkout "$(git merge-base newpackage base)" packages.json
cd ..
nim c -d:release packagescanner2.nim
./packagescanner2 temprepo/packages_new.json --old=temprepo/packages.json --check-urls
