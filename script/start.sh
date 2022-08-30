#!/bin/bash
# Docker 容器启动时内部执行的脚本

while :
do
    # 检查 Clash 进程是否存在，不存在需要重启
    bash c_check.sh
    if [ $? -gt 0 ]; then
        echo "Clash 不在运行！进行重启......"
        bash c_stop.sh
        bash c_start.sh
    else
        echo "Clash 运行中......"
    fi
    sleep 5
done