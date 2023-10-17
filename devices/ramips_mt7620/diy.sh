#!/bin/bash

# Modify Default IP
sed -i "s/192.168.1/172.16.2/" package/base-files/files/bin/config_generate
# sed -i "s/192.168.1/172.16.2/" package/feeds/zjw57/base-files/files/bin/config_generate

# Remove links
# sed -i "s/Kiddin'/zjw57/" package/feeds/zjw57/base-files/files/etc/banner
# sed -i "s/Kiddin'/zjw57/" package/feeds/zjw57/base-files/files/etc/openwrt_release
# rm -rf package/feeds/zjw57/my-default-settings/files/usr

# uci-defaults
cp -f devices/common/uci-defaults/* package/base-files/files/etc/uci-defaults/
