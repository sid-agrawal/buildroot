#!/bin/bash

copyPythonFiles() {
  pushd .
  cd output/target/root/proc
  echo "Copying model files"
  cp $1/scripts/proc/*.py .
  popd
}

copyPFSFiles() {
  pushd .
  # Copy the .so files and binary files
  # Replace this with overlay instructions (XXX)
  cd output/build/libpfs-cellulos
  echo "Copying pypfs files"
  mkdir -p ../../target/root/proc/pfs/lib
  cp lib/pypfs.cpython-310-x86_64-linux-gnu.so \
     ../../target/root/proc/pfs/lib/pypfs.cpython-310-$1-linux-gnu.so
  cp lib/libpfs.so ../../target/root/proc/pfs/lib/libpfs.so
  cp out/* ../../target/root/proc
  popd
}

USAGE_TEXT=$'Usage: ./build-helper.sh <x86_64 | aarch64> <root of OSMosis dir>'

if [ $# -ne 2 ]; then
  echo "Please specify the arch: x86_64 or aarch64"
  echo "$USAGE_TEXT"
  exit 1
fi

mkdir -p output/target/root/proc

case "$1" in
x86_64)
  copyPythonFiles $2
  copyPFSFiles $1
  ;;
aarch64)
  copyPythonFiles $2
  copyPFSFiles $1
  ;;
*)
    echo $USAGE_TEXT
    ;;
esac
