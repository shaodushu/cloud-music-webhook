
#!/bin/bash 
WORK_PATH='/data/projects/NeteaseCloudMusicApi'
cd $WORK_PATH
echo "先清除老代码"
git reset --hard origin/master
git clean -f
echo "拉取新代码"
git pull origin master
echo "开始执行构建后端项目:NeteaseCloudMusicApi为docker镜像名称 3.27.0为版本号"
docker build -t NeteaseCloudMusicApi:3.27.0 .
echo "停止旧容器 并删除旧容器"
docker stop NeteaseCloudMusicApi-container
docker rm NeteaseCloudMusicApi-container
echo "启动新容器"
docker container run -p 3000:3000 --name NeteaseCloudMusicApi-container -d NeteaseCloudMusicApi:3.27.0