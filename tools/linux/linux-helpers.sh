#!/usr/bin/sh

DownloadLinux() {
    wget "$LINUX_URL/$LINUX_ARCHIVE" -O "$DOWNLOAD_DIR/$LINUX_ARCHIVE"
    cd "$TARGET_DIR"
    xz -dc $DOWNLOAD_DIR/$LINUX_ARCHIVE | tar x
}

ConfigureLinux() {

}
