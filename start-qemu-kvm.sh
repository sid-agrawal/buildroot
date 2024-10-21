#!/bin/sh
(
SCRITPS_DIR="${0%/*}/"
echo "SCRITPS_DIR: " $SCRIPTS_DIR
cd ${SCRITPS_DIR}/output/images
pwd

if [ "${1}" = "serial-only" ]; then
    EXTRA_ARGS='-nographic'
else
    EXTRA_ARGS='-serial stdio'
fi

export PATH="/home/siagraw/buildroot/qemu/buildroot-x86/output/host/bin:${PATH}"
exec qemu-system-x86_64  \
    -monitor telnet::45454,server,nowait \
    --enable-kvm  \
    -M pc \
    -kernel bzImage  \
    -drive file=rootfs.ext2,if=virtio,format=raw  \
    -append "rootwait root=/dev/vda console=tty1 console=ttyS0"   \
    -net nic,model=virtio -net user  ${EXTRA_ARGS}
)
