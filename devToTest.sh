#! /bin/bash
modules=("common" "index" "item" "ucenter" "order" "article")
dev="qa80"

for mod in ${modules[@]}
do
echo "It's ready to release [$mod] ...";
cd $mod;
#fisp release -Dopmd $dev;
fisp release -Dopmd $dev;
cd ..;
sleep 1;
done
echo ">>>>>>>>>>All modules is released!<<<<<<<<<<<";

#当前文件夹下产出的 output 文件夹就是要的东西了.
#根据服务器的部署路径，修改下路径.

