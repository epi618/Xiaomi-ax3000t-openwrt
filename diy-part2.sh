#!/bin/bash
# Description: OpenWrt DIY script part 2 (After Update feeds)

# 1. 修改默认后台登录 IP 为 192.168.2.1
sed -i 's/192.168.1.1/192.168.2.1/g' package/base-files/files/bin/config_generate

# 2. 直接拉取经典版 PassWall 前端源码（避开 feeds 索引缺失 bug）
rm -rf package/luci-app-passwall
git clone --depth=1 https://github.com/xiaorouji/openwrt-passwall.git package/luci-app-passwall

# 3. 物理删除不需要的冗余插件目录（保留 autoreboot，其余彻底剔除）
rm -rf feeds/luci/applications/luci-app-vsftpd
rm -rf feeds/luci/applications/luci-app-vlmcsd
rm -rf feeds/luci/applications/luci-app-upnp
rm -rf feeds/luci/applications/luci-app-arpbind
rm -rf feeds/packages/net/vsftpd
rm -rf feeds/packages/net/vlmcsd
rm -rf feeds/packages/net/miniupnpd

# 4. 设置默认主题为 Argon
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# 5. 预置最新的 v2ray-rules-dat 规则库
curl -sSL https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geoip.dat -o package/base-files/files/usr/share/v2ray/geoip.dat 2>/dev/null || true
curl -sSL https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geosite.dat -o package/base-files/files/usr/share/v2ray/geosite.dat 2>/dev/null || true
