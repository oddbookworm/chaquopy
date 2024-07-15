#!/bin/bash
set -eu

export ANDROID_NDK_HOME=$ANDROID_HOME/ndk
export PATH=$PATH:$(ls $ANDROID_NDK_HOME|echo $ANDROID_NDK_HOME/*)

cd build-scripts
./androidbuild.sh org.sdl2 /dev/null
cd ../build/org.sdl2/app
rm -rf jni/src
ndk-build -j$CPU_COUNT