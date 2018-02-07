# Alexa for Raspbian\(NOOBS stretch\)

---

이 페이지는 Amazon에서 개발한 Alexa Voice Service를 INS\_VOICE\(가칭\)를 이용하여 사용하는 방법을 기술합니다.

 
#### Raspbian 설치 방법
라즈비안을 이용하기 위해서는 아래 가이드를 참고하세요.

[Raspberry Pi Software Guide](https://www.raspberrypi.org/learning/software-guide/)

#### Audio 환경 설정 및 테스트
- ##### 오디오 환경
```
Audio Input: iotoi AFE-DB410C  
Audio Output: Raspberry Pi 3.5mm jack
```

##### 1. XMOS 보드를 Raspberry Pi에 연결
- 연결이 잘 되었는지 확인합니다.

##### 2. Audio 출력 설정 확인
- 아래 명령을 이용하여 Audio output 정보를 확인합니다.
```
$ aplay -l
```
![](/assets/raspbian_audio_step_1.jpg)

##### 3. Audio 입력 설정 확인
- 아래 명령을 이용하여 Audio input 정보를 확인합니다.
```
$ arecord -l
```
![](/assets/raspbian_audio_step_2.jpg)

##### 4. Audio 입력을 XMOS board로 변경
- 다음과 같이 변경합니다.  
  ```
  $ nano .asoundrc
  
  사용방법
  pcm "hw: <card number>, <device number>
  
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
      pcm "hw:0,0"
    }
  }
  ```
![](/assets/raspbian_audio_step_3.jpg)

##### 5. 재부팅
- 부팅이 완료되면 설정이 정상적으로 오디오가 동작되는지 확인합니다.
  ```
  $ sudo shutdown -r
  ```
  
##### 6. Audio 출력 테스트
- 소리가 정상적으로 출력되는지 확인합니다.
- 테스트를 종료하려면 Ctrl + C 를 누르세요
```
$ speaker-test -t wav
```
![](/assets/raspbian_audio_step_4.jpg)

##### 7. Audio 입력 테스트
- 5초 동안 음성을 저장합니다. 아래 커맨드를 입력하고 음성을 입력하세요.
```
$ arecord --format=S16_LE --duration=5 --rate=16000 out.wav
Recording WAVE 'out.wav' : Signed 16 bit Little Endian, Rate 16000 Hz, Mono
```
##### 8. Audio 녹음 테스트
- 저장된 음성을 재생합니다. 음성이 정상적으로 재생되는지 확인합니다.
```
$ aplay out.wav
```

#### Alexa Voice Sevrice 설치

##### 1. 작업 디렉토리 생성
```
$ mkdir workspace
$ cd workspace
```

##### 2. AVS 인스톨 스크립트 다운로드
```
$ git clone https://github.com/alexa/alexa-avs-sample-app.git
$ cd alexa-avs-sample-app
$ nano automated_install.sh
```
##### 3. AVS 인스톨 스크립트 수정
- 빨간색 부분을 수정합니다.![](/assets/avs_script_edit_1.jpg)
- AVS 등록에서 생성한 ProductID, ClientID, ClientSecret 를 사용합니다.  
![](/assets/avs_script_edit_2.jpg)

- 편집이 완료되면 , Ctrl + O 를 누릅니다. 파일이름을 확인하고 Enter키를 누릅니다.  
![](/assets/avs_script_edit_3.jpg)

- 저장이 완료되면 Ctrl + X로 nano 에디터를 종료합니다.
- install 스크립트에 실행 권한을 부여합니다.
```
chmod +x automated_install.sh
```

##### 4. 설치 스트립트를 실행합니다.
- 실행 명령을 입력합니다.
```
. automated_install.sh
```
![](/assets/avs_script_edit_4.jpg)

- 라이센스 동의에 "y"를 입력하고 Enter를 누릅니다.
![](/assets/avs_script_edit_5.jpg)

- 사용자 계정을 이미 만들었으므로, "y"를 입력하고 Enter를 누릅니다.
![](/assets/avs_script_edit_6.jpg)

- 스크립트에 입력한 ProductID, ClientID, ClientSecret가 정확한지 확인합니다.  
- 문제가 없으면 "y"를 입력하고 Enter를 누릅니다.
![](/assets/avs_script_edit_7.jpg)

- 사용할 위치에서 "1" US를 선택합니다.
![](/assets/avs_script_edit_8.jpg)

- Audio out은 "1" 을 선택합니다.
![](/assets/avs_script_edit_9.jpg)

- Alexa wake word 사용에 대해 "y"를 입력하고 Enter를 누릅니다.
![](/assets/avs_script_edit_10.jpg)

- 설치를 시작합니다. 약 15~20분정도 소요됩니다.  
- 설치가 완료 되면 아래와 같은 화면이 나타납니다.
![](/assets/avs_script_edit_11.jpg)

