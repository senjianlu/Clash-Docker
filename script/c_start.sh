#!/bin/bash

# 1. 设置代理认证信息和节点信息
sed -i "6c \ \ - \"$RAB_PROXY_USERNAME:$RAB_PROXY_PASSWORD\"" /root/.config/clash/config.yaml

# 2. 如果存在 RAB_CLASH_RELAY_NODE_INFO 环境变量，就替换第 13 行的节点信息，否则注释第 13 行
if [ -n "$RAB_CLASH_RELAY_NODE_INFO" ]; then
    sed -i "13c \ \ - $RAB_CLASH_RELAY_NODE_INFO" /root/.config/clash/config.yaml
else
    # 在第 13 行前面加上 # 注释掉
    sed -i "13c \ \ # - {name: relay_node, type: trojan, server: github.com, port: 443, password: my_password }" /root/.config/clash/config.yaml
fi

# 3. 替换第 14 行的节点信息
sed -i "14c \ \ - $RAB_CLASH_NODE_INFO" /root/.config/clash/config.yaml

# 4. 如果存在 RAB_CLASH_RELAY_NODE_INFO 环境变量，则使用注释并不使用第 25 行的直连节点
if [ -n "$RAB_CLASH_RELAY_NODE_INFO" ]; then
    # 在第 25 行前面加上 # 注释掉
    sed -i '25c \ \ # - MATCH,node' /root/.config/clash/config.yaml
else
    # 在第 20 行前面加上 # 注释掉
    sed -i '20c \ \ # - relay_node' /root/.config/clash/config.yaml
    # 在第 27 行前面加上 # 注释掉
    sed -i '27c \ \ # - MATCH,relaid_node' /root/.config/clash/config.yaml
fi

# 5. 启动 Clash
nohup ./clash >/dev/null 2>&1 &