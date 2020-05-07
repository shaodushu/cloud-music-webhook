#!/bin/bash 
WORK_PATH='/data/projects/cloud-music'
cd $WORK_PATH
echo "先清除老代码"
git reset --hard origin/master
git clean -f
echo "拉取新代码"
git pull origin master
echo "编译build"
yarn run build
echo "开始执行构建前端项目:cloud-music为docker镜像名称 0.1.0为版本号"
docker build -t cloud-music:0.1.0 .
echo "停止旧容器 并删除旧容器"
docker stop cloud-music-container
docker rm cloud-music-container
echo "启动新容器"
docker container run -p 80:80 --name cloud-music-container -d cloud-music:0.1.0