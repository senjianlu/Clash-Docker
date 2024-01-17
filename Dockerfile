# 基础镜像系统版本为 dreamacro/clash:latest
FROM dreamacro/clash:latest

# 维护者信息
LABEL maintainer="Rabbir admin@cs.cheap"

# Docker 内用户切换到 root
USER root

# 设置时区为东八区
ENV TZ Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime > /etc/timezone

# 启动命令
ENTRYPOINT ["/clash"]