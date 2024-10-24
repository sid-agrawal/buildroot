#!/bin/bash

copyPythonFiles() {
  pushd .
  cd output/target/root/proc
  echo "Copying model files"
  cp ~/OSmosis/scripts/proc/*.py .
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

USAGE_TEXT=$'Usage: ./build-helper.sh x86_64 | aarch64'

if [ -z "$1" ]; then
  echo "Please specify the arch: x86_64 or aarch64"
  echo "$USAGE_TEXT"
  exit 1
fi

copyPythonFiles
copyPFSFiles $1

case "$1" in
x86_64)
  copyPythonFiles
  copyPFSFiles $1
  ;;
aarch64)
  copyPythonFiles
  setNeo4jPaths $1
  ;;
*)
    echo $USAGE_TEXT
    ;;
esac