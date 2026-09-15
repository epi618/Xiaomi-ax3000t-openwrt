#!/bin/bash
# Description: OpenWrt DIY script part 1 (Before Update feeds)

# 清除所有历史遗留 passwall 相关的 feed 行
sed -i '/passwall/d' feeds.conf.default

# 注入核心依赖包仓库 (采用官方 main 分支)
echo 'src-git passwallpkg https://github.com/xiaorouji/openwrt-passwall-packages.git;main' >> feeds.conf.default
