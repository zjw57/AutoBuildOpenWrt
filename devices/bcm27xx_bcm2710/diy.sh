#!/bin/bash

# Modify Default IP
sed -i "s/192.168.1/172.16.3/" package/base-files/files/bin/config_generate
# sed -i "s/192.168.1/172.16.1/" package/feeds/zjw57/base-files/files/bin/config_generate

# uci-defaults
cp -f devices/common/uci-defaults/* package/base-files/files/etc/uci-defaults/

sed -i 's/DEFAULT_PACKAGES +=/DEFAULT_PACKAGES += fdisk lsblk kmod-usb-net-asix-ax88179 kmod-usb-net-rtl8152/' target/linux/bcm27xx/Makefile

wget -N https://github.com/RPi-Distro/firmware-nonfree/raw/bullseye/debian/config/brcm80211/brcm/brcmfmac43436-sdio.bin -P files/lib/firmware/brcm/
wget -N https://github.com/RPi-Distro/firmware-nonfree/raw/bullseye/debian/config/brcm80211/brcm/brcmfmac43436-sdio.txt -P files/lib/firmware/brcm/
wget -N https://github.com/RPi-Distro/firmware-nonfree/raw/bullseye/debian/config/brcm80211/brcm/brcmfmac43436s-sdio.bin -P files/lib/firmware/brcm/
wget -N https://github.com/RPi-Distro/firmware-nonfree/raw/bullseye/debian/config/brcm80211/brcm/brcmfmac43436s-sdio.txt -P files/lib/firmware/brcm/

# Set Rust build arg llvm.download-ci-llvm to false.
RUST_MAKEFILE="feeds/packages/lang/rust/Makefile"
if [[ -f "${RUST_MAKEFILE}" ]]; then
  printf "Modifying %s...\n" "${RUST_MAKEFILE}"
  sed -i 's/--set=llvm\.download-ci-llvm=true/--set=llvm.download-ci-llvm=false/' "${RUST_MAKEFILE}"
else
  echo "File ${RUST_MAKEFILE} does not exist." >&2
fi
