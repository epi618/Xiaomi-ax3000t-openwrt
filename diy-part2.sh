#!/bin/bash
# Description: OpenWrt DIY script part 2 (After Update feeds)

# 1. 修改默认管理后台 IP 为 192.168.2.1
sed -i 's/192.168.1.1/192.168.2.1/g' package/base-files/files/bin/config_generate


# 2. 物理移除不需要的冗余插件
rm -rf feeds/luci/applications/luci-app-vsftpd
rm -rf feeds/luci/applications/luci-app-vlmcsd
rm -rf feeds/luci/applications/luci-app-upnp
rm -rf feeds/luci/applications/luci-app-arpbind
rm -rf feeds/packages/net/vsftpd
rm -rf feeds/packages/net/vlmcsd
rm -rf feeds/packages/net/miniupnpd

# 3. 设定默认主题为 Argon
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# 4. 预置最新的 v2ray-rules-dat 规则库（必须先 mkdir）
mkdir -p package/base-files/files/usr/share/v2ray
curl -sSL --connect-timeout 10 --retry 3 https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geoip.dat -o package/base-files/files/usr/share/v2ray/geoip.dat
curl -sSL --connect-timeout 10 --retry 3 https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geosite.dat -o package/base-files/files/usr/share/v2ray/geosite.dat
