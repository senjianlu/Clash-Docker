# Clash-docker
内置 Clash 的 Docker 镜像构建脚本

## 构建
```bash
docker build -t rabbir/clash:latest . --no-cache
```

## 启动
```bash
docker run -d --restart always \
  -p 1080:7893 \
  -e RAB_SOCKS5_USERNAME=test \
  -e RAB_SOCKS5_PASSWORD=test \
  -e RAB_CLASH_NODE_INFO="{name: node, type: trojan, server: github.com, port: 443, password: my_password }" \
  --name clash \
  rabbir/clash:latest
```
> **注意：** 节点 `name` 字段的值一定要为 `node`，否则无法与配置文件中的 `- MATCH,node` 对应。