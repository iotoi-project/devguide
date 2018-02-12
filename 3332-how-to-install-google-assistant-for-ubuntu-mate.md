# Google Assistant for Ubuntu MATE 16.04

---
이 페이지는 Google Assistant를 INS\_VOICE\(가칭\)를 이용하여 사용하는 방법을 기술합니다.

#### Ubuntu MATE 16.04 설치 방법
Ubuntu MATE 16.04를 이용하기 위해서는 아래 가이드를 참고하세요.
How to install Ubuntu MATE 16.04 for Raspberry Pi

#### Audio 환경 설정 및 테스트
- ##### 오디오 환경
```
Audio Input: iotoi AFE-DB410C MIC
Audio Output: iotoi AFE-DB410C Speaker
```
    
##### 1. Audio 설정 변경
- iotoi AFE-DB410C를 통해서 audio input/output을 처리하기 위해서는 별도의 설정이 필요합니다.
- Audio blacklist 환경설정 파일을 수정합니다.
```
sudo nano /etc/modprobe.d/blacklist.conf
```
![](/assets/ubuntu_audio_step_1.png)
- 제일 하단으로 이동하여 다음 내용을 추가합니다.
```
blacklist snd_bcm2835
```
![](/assets/ubuntu_audio_step_2.png)
- Ctrl+o 를 눌러 파일을 저장합니다. Ctrl+x 를 눌러 nano 에디터를 종료합니다.
- 시스템을 재부팅합니다.
```
sudo shutdown -r
```
  
##### 2. Audio 출력 설정 확인
- 아래 명령을 이용하여 Audio output 정보를 확인합니다.
```
$ aplay -l
```
![](/assets/ubuntu_audio_step_3.png)

##### 3. Audio 입력 설정 확인
- 아래 명령을 이용하여 Audio input 정보를 확인합니다.
```
$ arecord -l
```
![](/assets/ubuntu_audio_step_4.png)

 
##### 4. Audio 출력 테스트
- 소리가 정상적으로 출력되는지 확인합니다.
- 테스트를 종료하려면 Ctrl + C 를 누르세요
```
$ speaker-test -t wav
```
![](/assets/ubuntu_audio_step_4.png)

##### 5. Audio 입력 테스트
- 5초 동안 음성을 저장합니다. 아래 커맨드를 입력하고 음성을 입력하세요.
```
$ arecord --format=S16_LE --duration=5 --rate=16000 out.wav
Recording WAVE 'out.wav' : Signed 16 bit Little Endian, Rate 16000 Hz, Mono
```
##### 6. Audio 녹음 테스트
- 저장된 음성을 재생합니다. 음성이 정상적으로 재생되는지 확인합니다.
```
$ aplay out.wav
```

#### Google Assistant 설치

##### 1. Python 가상환경 설정
- Python 가상 환경을 설치합니다.
```
$ sudo apt-get update
$ sudo apt-get install python3-dev python3-venv # Use python3.4-venv if the package cannot be found.
$ python3 -m venv env
$ env/bin/python -m pip install --upgrade pip setuptools
$ source env/bin/activate
```

##### 2. 시스템 종속 패키지 설치

* 시스템 종속 패키지를 설치합니다.
  ```
  (env)$ sudo apt-get install portaudio19-dev libffi-dev libssl-dev
  ```

##### 3. Python 패키지 업그레이드

* pip를 사용하여 Python 최신 패키지로 업그레이드합니다.
  ```
  (env)$ python -m pip install --upgrade google-assistant-library
  ```

##### 4. Google Assistant 다운로드

* Google Assistant SDK sample을 다운받아 설치합니다.
  ```
  (env)$ python -m pip install --upgrade google-assistant-sdk[samples]
  ```

##### 5. 자격 증명서 설치

* 인증 툴을 설치 또는 업그레이드 합니다.
  ```
  (env)$ python -m pip install --upgrade google-auth-oauthlib[tool]
  ```

##### 5. 인증

* 인증툴을 이용하여 인증 절차를 진행합니다.

  ```
  (env)$ google-oauthlib-tool --scope https://www.googleapis.com/auth/assistant-sdk-prototype --save --headless --client-secrets /path/to/client_secret_client-id.json
  ```

* Step 1\) Please visit this URL to authorize this application 뒤에 나오는 URL을 복사하여 브라우져를 이용하여 접속합니다.  
  ![](/assets/rpi3_raspbian_google_assistant_step_1.jpg)

* Step 2\) 가지고 있는 google 계정을 입력하고 "NEXT"를 클릭합니다.  
  ![](/assets/dragonBoard_google_assistant_step_2.png)

* Step 3\) 패스워드를 입력하고 "NEXT" 클릭합니다.  
  ![](/assets/dragonBoard_google_assistant_step_3.png)

* Step 4\) 새로 생성한 "Google Assistant for db410" 프로젝트에 대해 계정 접근을 허용합니다. "ALLOW"를 클릭합니다.  
  ![](/assets/dragonBoard_google_assistant_step_4.png)

* Step 5\) 생성된 코드를 복사합니다.  
  ![](/assets/dragonBoard_google_assistant_step_5.png)

* Step 6\) 복사한 코드를 terminal에 복사합니다.  
  ![](/assets/rpi3_raspbian_google_assistant_step_2.jpg)

##### 6. 디바이스 모델 등록

* 디바이스 모델을 등록합니다. 아래는 예제입니다.
  ```
  (env) $ googlesamples-assistant-devicetool register-model --manufacturer "Assistant SDK developer" --product-name "Assistant SDK light" --type LIGHT --model roy-model
  (env) $ googlesamples-assistant-devicetool list --model 
  Device Model Id: roy-model 
  Project Id: lofty-ivy-192309 
  Device Type: action.devices.types.LIGHT 
  No traits
  ```

##### 7. Google Assistant 실행

* Google Assistant를 실행합니다.
```
(env) $ googlesamples-assistant-hotword --project_id lofty-ivy-192309 --device_model_id roy-model
Device registered. ON_MUTED_CHANGED: {'is_muted': False} 
ON_START_FINISHED
ON_CONVERSATION_TURN_STARTED 
ON_END_OF_UTTERANCE 
ON_RECOGNIZING_SPEECH_FINISHED:
```



