
#!/bin/bash 
WORK_PATH='/data/projects/NeteaseCloudMusicApi'
cd $WORK_PATH
echo "先清除老代码"
git reset --hard origin/master
git clean -f
echo "拉取新代码"
git pull origin master
echo "开始执行构建后端项目:netease-cloud-music-api为docker镜像名称 3.27.0为版本号"
docker build -t netease-cloud-music-api:3.27.0 .
echo "停止旧容器 并删除旧容器"
docker stop netease-cloud-music-api-container
docker rm netease-cloud-music-api-container
echo "启动新容器"
docker container run -p 3000:3000 --name netease-cloud-music-api-container -d netease-cloud-music-api:3.27.0