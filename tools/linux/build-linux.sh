#!/usr/bin/sh

LINUX_VERSION=$1
DOWNLOAD_DIR=`realpath $2`
TARGET_DIR=`realpath $3`

LINUX="linux-$LINUX_VERSION"
LINUX_ARCHIVE="$LINUX.tar.xz"
LINUX_MAJOR_VERSION=$(echo $LINUX_VERSION | grep -oP "[0-9]+" | head -1)
LINUX_URL="https://mirrors.edge.kernel.org/pub/linux/kernel/v$LINUX_MAJOR_VERSION.x"

mkdir -p $DOWNLOAD_DIR
mkdir -p $TARGET_DIR

PLATFORM="qemu-arm-virt"
ARCH="arm64"
TOP_DIR=$PWD

DownloadLinux() {
    # wget "$LINUX_URL/$LINUX_ARCHIVE" -O "$DOWNLOAD_DIR/$LINUX_ARCHIVE"
    cd "$TARGET_DIR"
    # tar xf $DOWNLOAD_DIR/$LINUX_ARCHIVE
}

ConfigureLinux() {
    configure_flags="ARCH=$ARCH CROSS_COMPILE=aarch64-linux-gnu-"
    cp $TOP_DIR/configs/linux/${PLATFORM}_config_${LINUX_VERSION} $TARGET_DIR/$LINUX/.config
    cp $TOP_DIR/configs/linux/${PLATFORM}_Module.symvers_${LINUX_VERSION} $TARGET_DIR/$LINUX/Module.symvers_
    cd "$TARGET_DIR/$LINUX"
    make oldconfig $configure_flags
    make prepare $configure_flags
    make modules_prepare $configure_flags
}

DownloadLinux
ConfigureLinux
