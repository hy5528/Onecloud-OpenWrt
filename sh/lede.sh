#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#
# 内核，参照 kiddin9
rm -rf target/linux/amlogic
shopt -s extglob
SHELL_FOLDER=$(dirname $(readlink -f "$0"))
merge_package main https://github.com/lxiaya/openwrt-onecloud target/linux target/linux/amlogic
sed -i "s/wpad-openssl/wpad-basic-mbedtls/" target/linux/amlogic/image/Makefile
# sed -i "s/neon-vfpv4/vfpv4/" target/linux/amlogic/meson8b/target.mk
rm -rf package/feeds/routing/batman-adv


# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
echo "src-git passwall_packages https://github.com/xiaorouji/openwrt-passwall-packages.git;main" >> "feeds.conf.default"
echo "src-git passwall https://github.com/xiaorouji/openwrt-passwall.git;main" >> "feeds.conf.default"
sed -i '2s/^#//' feeds.conf.default
sed -i '3s/^/#/' feeds.conf.default
echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default

# git clone -b lua https://github.com/sbwml/luci-app-alist package/alist
# git clone https://github.com/rufengsuixing/luci-app-onliner package/onliner
