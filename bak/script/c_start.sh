#!/bin/bash

# 1. 设置代理认证信息和节点信息
sed -i "6c \ \ - \"$RAB_SOCKS5_USERNAME:$RAB_SOCKS5_PASSWORD\"" /root/.config/clash/config.yaml
sed -i "13c \ \ - $RAB_CLASH_NODE_INFO" /root/.config/clash/config.yaml

# 2. 后台启动 Clash
nohup /usr/local/bin/clash >/dev/null 2>&1 &