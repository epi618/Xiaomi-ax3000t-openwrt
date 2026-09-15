#!/bin/bash
# Description: OpenWrt DIY script part 1 (Before Update feeds)

# 1. 移除可能残留的 passwall2 源，防止与经典版冲突
sed -i '/passwall2/d' feeds.conf.default

# 2. 注入经典版 PassWall 官方源码仓库及核心依赖组件库
echo 'src-git passwall_packages https://github.com/xiaorouji/openwrt-passwall-packages.git;main' >> feeds.conf.default
echo 'src-git passwall_luci https://github.com/xiaorouji/openwrt-passwall.git;main' >> feeds.conf.default
