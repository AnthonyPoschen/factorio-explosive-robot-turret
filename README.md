
how to download audio for making sound effects

do this to download
```bash
yt-dlp -x --audio-format opus "https://youtube.com/watch?v=?????" -o ytaudio.opus
```

do this to then make a clip for sound
"ss" is start time in seconds, fractions work
"t" is duration from start time
```bash
ffmpeg -i ytaudio.opus -ss 4.5 -t 1.5 -c:a libvorbis output.ogg
```

test you like the audio with ffmpeg
```bash
ffplay -loop 0 output.ogg
```

if you like it move to sounds :)
