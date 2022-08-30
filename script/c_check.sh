#!/bin/bash

count=`ps -ef |grep clash |grep -v grep |wc -l`
if [ $count -le 0 ]; then exit 1; else exit 0; fi