# Alexa for Raspbian\(NOOBS stretch\)

## Audio 환경 설정 및 테스트

Audio Input: XMOS
Audio Output: XMOS 3.5mm jack

XMOS 보드를 Raspberry Pi에 연결합니다.

연결이 잘 되었는지 확인합니다.

1. Audio 출력 설정을 확인합니다.

```
$ aplay -l
```

![](/assets/raspbian_audio_step_1.jpg)

1. Audio 입력 설정을 확인합니다.

```
$ arecord -l
```

![](/assets/raspbian_audio_step_2.jpg)

Audio 입력 및 출력을 XMOS board로 변경합니다.

```
$ nano .asoundrc
```

다음과 같이 변경합니다.

```
pcm.!default {
  type asym
  capture.pcm "mic"
  playback.pcm "speaker"
}

pcm.mic {
  type plug
  slave {
    pcm "hw:1,0"
  }
}

pcm.speaker {
  type plug
  slave {
    pcm "hw:1,0"
  }
}
```

![](/assets/raspbian_audio_step_3.jpg)

재부팅합니다.

```
$ sudo shutdown -r now
```

부팅이 완료되면 설정이 정상적으로 되었는지 확인합니다.

1. Audio 출력 테스트 \(테스트를 종료하려면 Ctrl + C 를 누르세요\)

```
$ speaker-test -t wav
```

![](/assets/raspbian_audio_step_4.jpg)

소리가 정상적으로 출력되는지 확인합니다.

1. Audio 입력 테스트 \(5초 동안 음성을 저장합니다. 아래 커맨드를 입력하고 음성을 입력하세요. \)

```
$ arecord --format=S16_LE --duration=5 --rate=16000 out.wav
Recording WAVE 'out.wav' : Signed 16 bit Little Endian, Rate 16000 Hz, Mono
```

저장된 음성을 재생합니다. 음성이 정상적으로 재생되는지 확인합니다.

```
$ aplay out.wav
```



