# Clash-Docker
内置 Clash 的 Docker 镜像构建脚本。  
基于 [`dreamacro/clash`](https://hub.docker.com/r/dreamacro/clash) 镜像构建，添加了 `tzdata` 时区支持。

## 构建
```bash
docker build -t rabbir/clash:latest . --no-cache
```

## 启动
```bash
docker run -d --restart always \
  -p 7893:7893 \
  --name clash \
  rabbir/clash:latest
```

## 测试
```bash
curl -x socks5://test:test@127.0.0.1:7893 ip.sb
```