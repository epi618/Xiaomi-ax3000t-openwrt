#!/bin/bash
# Description: OpenWrt DIY script part 2 (After Update feeds)

# 1. 修改默认管理后台 IP 为 192.168.2.1
sed -i 's/192.168.1.1/192.168.2.1/g' package/base-files/files/bin/config_generate

# 2. 拉取 PassWall 前端源码到 package 目录
rm -rf package/luci-app-passwall
git clone --depth=1 -b main https://github.com/xiaorouji/openwrt-passwall.git package/luci-app-passwall

# 3. 物理移除不需要的冗余插件目录
rm -rf feeds/luci/applications/luci-app-vsftpd
rm -rf feeds/luci/applications/luci-app-vlmcsd
rm -rf feeds/luci/applications/luci-app-upnp
rm -rf feeds/luci/applications/luci-app-arpbind
rm -rf feeds/packages/net/vsftpd
rm -rf feeds/packages/net/vlmcsd
rm -rf feeds/packages/net/miniupnpd

# 4. 设定默认主题为 Argon
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile
