#### Endless stream radio like "lofi hip hop"

### Usage

Install `ffmpeg` and `mbuffer`

```
sudo apt update
sudo apt install ffmpeg mbuffer -y
```

Edit variables in `stream.sh` and run it

- `MUSIC_FOLDER` music folder
- `VIDEO` background video
- `RTMP_SERVERS` rtmp servers for stream. You can add extra server by appending `|[f=flv]rtmp://server2` to string

Run `sh stream.sh`

#### RTMP_SERVERS

**Youtube**: https://www.youtube.com/live_dashboard

Example: `rtmp://a.rtmp.youtube.com/live2/xxxx-xxxx-xxxx-xxxx-xxxx`

**vk.com**: https://vk.com/video

Example: `rtmp://stream2.vkuserlive.com:443/vlive.123.XXXXXXX/KEY`

**Twitch**: https://stream.twitch.tv/ingests

Example: `rtmp://live-hel.twitch.tv/app/{stream_key}`

### How it works

This bash-script is endless loop. Each iteration gets random file from `MUSIC_FOLDER` and with help of ffmpeg piping it to 20M buffer. Then buffer from `mbuffer` piping music to main `ffmpeg` process.

Video input for `ffmpeg` is `VIDEO`, audio input is pipe from buffer. Output is 1080p/30FPS stream to `RTMP_SERVERS`

### TODO
- [ ] check loop leaks
- [ ] check ffmpeg settings
- [ ] optimization
