#!/bin/bash
# Description: OpenWrt DIY script part 1 (Before Update feeds)

# 1. 彻底清除 feeds.conf.default 中所有带 passwall 的旧行（防止遗留有问题的源）
sed -i '/passwall/d' feeds.conf.default

# 2. 添加 passwall 核心依赖包仓库（主分支为 main）
echo 'src-git passwall_packages https://github.com/xiaorouji/openwrt-passwall-packages.git;main' >> feeds.conf.default

# 3. 添加 passwall luci 前端仓库（分支必须是 luci，切勿写成 main）
echo 'src-git passwall_luci https://github.com/xiaorouji/openwrt-passwall.git;luci' >> feeds.conf.default
