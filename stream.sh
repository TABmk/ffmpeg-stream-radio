#!/bin/bash

MUSIC_FOLDER='music/'

VIDEO=v.m4v

RTMP_SERVERS="[f=flv]rtmp://xxx"

while true; do
  ffmpeg -hide_banner -i $(find $MUSIC_FOLDER -type f | shuf -n 1) -vn -acodec copy -f mpegts - ;
done | mbuffer -q -c -m 20000k | (ffmpeg -hide_banner \
-stream_loop -1 -i $VIDEO \
-err_detect explode \
-i pipe:0 \
-map 0:v \
-map 1:a \
-pix_fmt yuv420p \
-s 1920x1080 \
-b:v 5000k \
-b:a 256k \
-acodec aac \
-vcodec libx264 \
-preset ultrafast \
-g 60 \
-threads 2 \
-flags +global_header \
-f tee $RTMP_SERVERS)
