# How to install Google Assistant for Dragon Board 410c

---

이 페이지는 Dragon Board 410c에 Google Assistant 설치를 설명합니다.

#### Download Debian 17.04.1

* [Debian 17.04.1 download](http://builds.96boards.org/releases/dragonboard410c/linaro/debian/17.04.1/dragonboard410c_sdcard_install_debian-246.zip)

#### Install Debian 17.04.1

##### 1. [Etcher download](https://etcher.io/)

##### 2. Install etcher

##### 3. Run etcher

##### 4. Select debian 17.04.1 binary

##### 5. Insert microSD to DragonBoard 410c

##### 6. Change DIP switch as a SD Boot

* ![](/assets/dragonBoard410c_junper_sdboot.png)

##### 7. Connect Power supply to DragonBoard 410c

##### 8. Install Debian 17.04.1

#### Install Google Assistant

##### 1. [Introduction to the Google Assistant Libaray](https://developers.google.com/assistant/sdk/guides/library/python/?hl=ko)

##### 2. Configure and Test the Audio

* Verify that recording and playback work. You can do this in the system sound settings or from the command line.
* Play a test sound \(this will be a person speaking\). Press Ctrl+C when done. If you don't hear anything when you run this, check your speaker connection.

  ```
   speaker-test -t wav
  ```

* Record a short audio clip.

  ```
   arecord --format=S16_LE --duration=5 --rate=16000 --file-type=raw out.raw
  ```

* Check the recording by replaying it.

  ```
   aplay --format=S16_LE --rate=16000 out.raw
  ```

* Adjust the playback and recording volume.

  ```
   alsamixer
  ```

* ## [Configure a Developer Project and Account Settings](https://developers.google.com/assistant/sdk/guides/library/python/embed/config-dev-project-and-account?hl=en)

#### Google Assistant 설치

##### 1. Python 가상환경 설정

* Python 가상 환경을 설치합니다.
  ```
  linaro@linaro-alip:~$ sudo apt-get update
  linaro@linaro-alip:~$ sudo apt-get install python3-dev python3-venv
  linaro@linaro-alip:~$ python3 -m venv env
  linaro@linaro-alip:~$ env/bin/python -m pip install --upgrade pip setuptools
  linaro@linaro-alip:~$ source env/bin/activate
  ```

##### 2. 시스템 종속 패키지 설치

* 시스템 종속 패키지를 설치합니다.

  ```
  (env) linaro@linaro-alip:~$ sudo apt-get install portaudio19-dev libffi-dev libssl-dev
  ```

* Generate credentials

##### 3. 자격 증명서 설치

* 인증 툴을 설치 또는 업그레이드 합니다.
  ```
  (env) linaro@linaro-alip:~$ python -m pip install --upgrade google-auth-oauthlib[tool]
  ```

##### 3. 인증서 업로드

* vsftp나 scp를 사용하여 client\_secret\_xxx.json 파일을 dragonboard에 upload합니다.
* vsftp 설치 방법은 How to install vsftpd를 참고하세요.

##### 4. 인증

* 인증툴을 이용하여 인증 절차를 진행합니다.

  ```
  (env) linaro@linaro-alip:~$ google-oauthlib-tool --client-secrets /home/linaro/client_secret_XXXXXX.apps.googleusercontent.com.json --scope https://www.googleapis.com/auth/assistant-sdk-prototype --save --headless
  ```

* Step 1\) Please visit this URL to authorize this application 뒤에 나오는 URL을 복사하여 브라우져를 이용하여 접속합니다.  
  ![](/assets/dragonBoard_google_assistant_step_1.png)

* Step 2\) 가지고 있는 google 계정을 입력하고 "NEXT"를 클릭합니다.  
  ![](/assets/dragonBoard_google_assistant_step_2.png)

* Step 3\)  패스워드를 입력하고 "NEXT" 클릭합니다.  
  ![](/assets/dragonBoard_google_assistant_step_3.png)

* Step 4\) 새로 생성한 "Google Assistant for db410" 프로젝트에 대해 계정 접근을 허용합니다. "ALLOW"를 클릭합니다.  
  ![](/assets/dragonBoard_google_assistant_step_4.png)

* Step 5\) 생성된 코드를 복사합니다.  
  ![](/assets/dragonBoard_google_assistant_step_5.png)

* Step 6\) 복사한 코드를 terminal에 복사합니다.  
  ![](/assets/dragonBoard_google_assistant_step_6.png)

##### 5. gRPC 및 Google Assistant 다운로드

* gRPC 및 Google Assistant Sample을 다운받아 설치합니다.
  ```
  (env) linaro@linaro-alip:~$ python -m pip install grpcio
  (env) linaro@linaro-alip:~$ python -m pip install grpcio-tools
  (env) linaro@linaro-alip:~$ python -m pip install --upgrade google-assistant-sdk[samples]
  ```

##### 6. 디바이스 모델 등록

* 디바이스 모델을 등록합니다. 아래는 예제입니다.  

  ```
  (env) linaro@linaro-alip:~$ googlesamples-assistant-devicetool register-model --manufacturer "Assistant SDK developer" --product-name "Assistant SDK light" --type LIGHT --model roy-model
  (env) linaro@linaro-alip:~$ googlesamples-assistant-devicetool list --model
  Device Model Id: roy-model
  Project Id: lofty-ivy-192309
  Device Type: action.devices.types.LIGHT
  No traits
```

##### 7. Google assistant SDK 다운로드

* Google assistant SDK을 다운받습니다.
  ```
  (env) linaro@linaro-alip:~$ git clone https://github.com/googlesamples/assistant-sdk-python
  (env) linaro@linaro-alip:~$ cp -r assistant-sdk-python/google-assistant-sdk/googlesamples/assistant/grpc new-project
  (env) linaro@linaro-alip:~$ cd new-project
  ```

##### 8. Google Assistant 실행

* Google Assistant를 실행합니다. 이 버전은 키를 입력 한 다음 음성을 이야기 해야 합니다.
  ```
  (env) linaro@linaro-alip:~/new-project$ python -m pushtotalk --device-model-id roy-model --project-id lofty-ivy-192309
  INFO:root:Connecting to embeddedassistant.googleapis.com
  Press Enter to send a new request...
  ```



