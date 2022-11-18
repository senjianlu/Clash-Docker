#!/bin/bash

# 关闭名字带 "clash" 的进程
kill -9 $(pgrep -f 'clash')