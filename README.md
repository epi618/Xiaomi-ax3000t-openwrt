# 适用于小米 AX3000T 的 OpenWrt 纯净轻量定制固件

> **重要警示**：  
> 本仓库及 Releases 固件专用于 **小米 AX3000T v1 版本（联发科 MT7981 芯片）**。请勿在 v2 硬件版本上强刷本固件或刷入不匹配的 U-Boot，否则极易导致硬件损坏（变砖）！  
> 阅读本文档时**请勿使用浏览器自带的网页翻译功能**，以避免 Markdown 排版被破坏。

---

## 一、 固件特色与定制说明

本固件基于成熟稳定的 Lean LEDE 源码进行极简定制，专为追求轻量、低内存占用及高网络性能的用户打造：

* **极致精简，纯净后台**：
  * 物理剔除无用服务（彻底关闭 UPnP、vlmcsd KMS 激活服务、vsftpd FTP 服务器）。
  * 移除左侧无用的“网络存储”大类菜单，保持侧边栏极度清爽。
* **分流与核心组件稳定闭环**：
  * **弃用规则容易崩溃的 PassWall 2，全面换回经典稳定版 PassWall (`luci-app-passwall`)**。
  * 固件随包编译了完整的 `xray-core`、`sing-box`、`chinadns-ng`、`dns2socks` 及配套 Geodata 规则库，彻底解决手动安装提示“缺少依赖”或内核哈希（Vermagic）不匹配的问题。
* **仅保留核心实用服务**：
  * **宽带监控**（`luci-app-nlbwmon`：精确统计各设备上下行流量）
  * **网络唤醒**（`luci-app-wol`：一键唤醒局域网主机/NAS）
  * **定时自动重启**（`luci-app-autoreboot`：保障长期运行无冗余缓存）
  * **科学分流**（经典版 `luci-app-passwall`）
* **开箱即用**：
  * 默认启用完整 **IPv6 支持** 及 **TurboACC 网络加速**（BBR 拥塞控制与流控加速）。
  * 开机即内置 **Argon 现代主题**。
  * 默认管理后台 IP 修改为 **`192.168.2.1`**，天然避开上级光猫的 `192.168.1.1` 地址冲突。

---

## 二、 编译与工作流优化细节

* **修复依赖与源冲突**：在 `diy-part1.sh` 中自动注入 xiaorouji 官方的 PassWall 及 Packages 依赖源，彻底剔除存在兼容性问题的 PassWall 2 源。
* **物理防反弹清理**：在 `diy-part2.sh` 中物理删除 vsftpd、vlmcsd、upnp 等插件目录，阻止 LEDE 默认配置在生成 `.config` 时将其强行塞回固件。
* **工作流维护更新**：
  * 升级 GitHub Actions 至现代版本（`actions/checkout@v4` 与 `actions/upload-artifact@v4`）。
  * 移除已废弃的 Node.js 20 旧插件，消除 Actions 编译日志中的弃用警告。
  * 保留磁盘清理机制，彻底解决 GitHub 虚拟环境磁盘空间不足的问题。

---

## 三、 使用指南

### 方式一：直接使用 Releases 固件
1. 前往本仓库的 **Releases** 页面下载最新构建的文件。
2. 认准以 **`...-squashfs-sysupgrade.bin`** 结尾的文件。
3. 路由器断电，按住 Reset 键插电 8~10 秒进入 U-Boot Web 恢复页面（`192.168.1.1`）。
4. 上传该固件刷入，等待路由器自动重启。
5. 刷写完成后，电脑改回自动获取 IP（DHCP），浏览器访问 **`192.168.2.1`** 即可进入后台。

> **U-Boot 刷入特别提示**：  
> 若使用的是 hanwckf 的多布局 U-Boot，原厂分区固件请根据固件对应选项选择（默认/Stock 选项）；如使用的是普通 LEDE 专属 U-Boot，直接上传 `squashfs-sysupgrade.bin` 即可。

### 方式二：Fork 仓库自行云编译
1. Fork 本仓库到你自己的 GitHub 账号。
2. 如需增删配置，可直接编辑仓库根目录下的 `.config`。
3. 点击 **Actions** -> 选择 **Build OpenWrt for AX3000T** -> 点击 **Run workflow** 触发构建。
4. 编译完成后在 Actions 运行详情底部的 **Artifacts** 处下载固件解压使用。

---

## 四、 默认系统信息

| 项目 | 默认值 |
| :--- | :--- |
| **后台登录 IP** | `192.168.2.1` |
| **登录用户名** | `root` |
| **登录密码** | `password` |
| **默认后台主题** | Argon |

> **注意**：云编译时请勿勾选使用 SSH 连接功能，以免因超时挂起导致流水线构建失败！

---

## 致谢
* [coolsnowwolf/lede](https://github.com/coolsnowwolf/lede)
* [P3TERX/Actions-OpenWrt](https://github.com/P3TERX/Actions-OpenWrt)
* [xiaorouji/openwrt-passwall](https://github.com/xiaorouji/openwrt-passwall)
* [jerrykuku/luci-theme-argon](https://github.com/jerrykuku/luci-theme-argon)
