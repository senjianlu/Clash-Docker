#!/bin/bash

# 查询名字带 "clash" 的进程个数，等于 0 则返回 1 表示出错
count=`ps -ef |grep clash |grep -v grep |wc -l`
if [ $count -le 0 ]; then exit 1; else exit 0; fi