#!/usr/bin/env bash
set -e # Exit if one of commands exit with non-zero exit code
set -u # Treat unset variables and parameters other than the special parameters ‘@’ or ‘*’ as an error
set -o pipefail # Any command failed in the pipe fails the whole pipe
# set -x # Print shell commands as they are executed (or you can try -v which is less verbose)

cd "$(dirname "$0")"

xcodegen # https://github.com/yonaskolb/XcodeGen
xcodebuild -scheme AeroSpace build -configuration Debug # no clean because it may lead to accessibility permission loss

rm -rf build && mkdir build
cp -r ~/Library/Developer/Xcode/DerivedData/AeroSpace*/Build/Products/Debug/AeroSpace-Debug.app build