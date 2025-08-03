#!/bin/bash

# Modify Default IP
sed -i "s/192.168.1/172.16.1/" package/base-files/files/bin/config_generate
# sed -i "s/192.168.1/172.16.1/" package/feeds/zjw57/base-files/files/bin/config_generate

# Remove links
# sed -i "s/Kiddin'/zjw57/" package/feeds/zjw57/base-files/files/etc/banner
# sed -i "s/Kiddin'/zjw57/" package/feeds/zjw57/base-files/files/etc/openwrt_release
# rm -rf package/feeds/zjw57/my-default-settings/files/usr

# uci-defaults
cp -f devices/common/uci-defaults/* package/base-files/files/etc/uci-defaults/

# Set Rust build arg llvm.download-ci-llvm to false.
RUST_MAKEFILE="feeds/packages/lang/rust/Makefile"
if [[ -f "${RUST_MAKEFILE}" ]]; then
  printf "Modifying %s...\n" "${RUST_MAKEFILE}"
  sed -i 's/--set=llvm\.download-ci-llvm=true/--set=llvm.download-ci-llvm=false/' "${RUST_MAKEFILE}"
else
  echo "File ${RUST_MAKEFILE} does not exist." >&2
fi
