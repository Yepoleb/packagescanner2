#!/bin/bash

set -e

targetRepository="https://github.com/nim-lang/packages"
targetBranch="master"

rm -rf temprepo
git clone "$targetRepository" temprepo
cd temprepo
git checkout "$targetBranch"
cd ..
nim c -d:release packagescanner2.nim
./packagescanner2 temprepo/packages.json
