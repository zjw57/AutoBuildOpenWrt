#!/bin/bash

# Modify Default IP
sed -i "s/192.168.1/172.16.2/" package/base-files/files/bin/config_generate
# sed -i "s/192.168.1/172.16.2/" package/feeds/zjw57/base-files/files/bin/config_generate

# Remove links
# sed -i "s/Kiddin'/zjw57/" package/feeds/zjw57/base-files/files/etc/banner
# sed -i "s/Kiddin'/zjw57/" package/feeds/zjw57/base-files/files/etc/openwrt_release
rm -f package/feeds/zjw57/my-default-settings/files/usr/lib/lua/luci/view/admin_status/index/links.htm
