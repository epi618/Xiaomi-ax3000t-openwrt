# Xiaomi AX3000T ImmortalWrt 固件自动编译

基于 GitHub Actions 自动化构建适用于 **小米路由器 AX3000T** 的 ImmortalWrt 固件。

---

## 固件特性与参数

- **源码分支**：[ImmortalWrt](https://github.com/immortalwrt/immortalwrt) Master 分支
- **目标硬件**：MediaTek Filogic 820 (MT7981B)
- **分区适配**：**OpenWrt U-Boot layout (`ubootmod`)**
- **默认后台地址**：`192.168.2.1`
- **默认登录凭据**：用户名 `root`，默认**无密码**
- **默认主题**：Argon 主题

---

## 集成功能组件

* **科学上网 & 分流**
  * **PassWall**：搭配现代轻量高效的 **Sing-Box** 核心引擎（支持 VLESS-Reality、Hysteria2、Trojan、Shadowsocks 等主流协议）
  * **ChinaDNS-NG** & **DNS2SOCKS**：国内外部 DNS 防污染解析与优化分流
* **网络与流量加速**
  * **Turbo ACC**：支持硬件流量分载（Hardware Flow Offloading）与 BBR 拥塞控制算法
* **内网穿透与远程组网**
  * **Tailscale**：零配置轻量级 Mesh 异地虚拟局域网
  * **Lucky**：全功能大集成动态域名解析（DDNS）、端口转发、反向代理及 SSL 证书管理
* **多宽带与实用工具**
  * **MWAN3 + Macvlan**：多线接入、单线多拨与智能负载均衡
  * **WoL**：网络唤醒（局域网远程唤醒台式机/NAS）
  * **基础运维**：TTYD 网页终端、定时自动重启等

---

## 仓库结构

```text
├── .github/
│   └── workflows/
│       └── build.yml       # GitHub Actions 自动化构建工作流
├── .config                 # 精简设备与插件配置
├── diy-part1.sh            # feeds 更新前脚本（注入外部源）
├── diy-part2.sh            # feeds 安装后脚本（修改后台 IP、设置主题等）
└── README.md
