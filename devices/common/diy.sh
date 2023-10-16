#!/bin/bash

# Add Feed Source
sed -i '$a src-git zjw57 https://github.com/kiddin9/openwrt-packages.git;master' feeds.conf.default
