#!/bin/bash
# Description: OpenWrt DIY script part 1 (Before Update feeds)

# 清理所有历史遗留的 passwall 源
sed -i '/passwall/d' feeds.conf.default

# 注入核心依赖包仓库（使用官方默认 main 分支）
echo 'src-git passwallpkg https://github.com/xiaorouji/openwrt-passwall-packages.git;main' >> feeds.conf.default
