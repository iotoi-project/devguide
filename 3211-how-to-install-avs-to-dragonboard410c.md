# How to install Alexa Voice Service for Dragon Board 410c

---

이 페이지는 Dragon Board 410c에 Alexa Voice Service 설치를 설명합니다.

#### Download Debian 17.09

* [Debian 17.09 download](http://builds.96boards.org/releases/dragonboard410c/linaro/debian/17.09/dragonboard410c_sdcard_install_debian-283.zip)

#### Install Debian 17.09

##### 1. [Etcher download](https://etcher.io/)

##### 2. Install etcher

##### 3. Run etcher

##### 4. Select debian 17.09 binary

##### 5. Insert microSD to DragonBoard 410c

##### 6. Change DIP switch as a SD Boot

* ![](/assets/dragonBoard410c_junper_sdboot.png)

##### 7. Connect Power supply to DragonBoard 410c

##### 8. Install Debian 17.09
- 인스톨이 완료되면 전원 케이블을 보드에서 분리합니다.
- Step 6) 에서 변경한 DIP switch를 원래대로 돌려 놓습니다.
- iotoi AFE-DB410C 보드를 DragonBoard410c에 부착합니다.
- 전원 케이블을 DragonBoard410c에 연결합니다.

##### 9. Boot Debian 17.09
- Debian 17.09의 설치가 끝나면 시스템을 업데이트 합니다.
```
sudo apt-get update
sudo apt-get upgrade
```

#### Audio 환경 설정 및 테스트
- ##### 오디오 환경
```
Audio Input: iotoi AFE-DB410C
Audio Output: iotoi AFE-DB410C
```

##### 1. Audio 출력 테스트
- 소리가 정상적으로 출력되는지 확인합니다.
- 테스트를 종료하려면 Ctrl + C 를 누르세요
```
$ speaker-test -t wav
```
![](/assets/raspbian_audio_step_4.jpg)

##### 2. Audio 입력 테스트
- 5초 동안 음성을 저장합니다. 아래 커맨드를 입력하고 음성을 입력하세요.
```
$ arecord --format=S16_LE --duration=5 --rate=16000 out.wav
Recording WAVE 'out.wav' : Signed 16 bit Little Endian, Rate 16000 Hz, Mono
```
##### 3. Audio 녹음 테스트
- 저장된 음성을 재생합니다. 음성이 정상적으로 재생되는지 확인합니다.
```
$ aplay out.wav
```

#### Alexa Voice Sevrice 설치

##### 1. 라이브러리 설치
- 아래 명령을 터미널에서 실행합니다.
```
$ sudo apt-get install openjdk-8-jdk vlc-nox vlc-data nano
```

##### 2. 라이브러리 경로 설정
- 아래 내용을 .bashrc에 추가합니다.
```
export LD_LIBRARY_PATH=/usr/lib/vlc
export VLC_PLUGIN_PATH=/usr/lib/vlc/plugins
unset JAVA_TOOL_OPTIONS
```
![](/assets/dragonBoard_avs_util_1.png)
![](/assets/dragonBoard_avs_util_2.png)

- Ctrl + o 로 추가한 내용을 저장합니다. 
- 저장이 완료되면 Ctrl + x로 nano를 종료합니다.
- 추가한 경로를 터미널에 반영하기 위해 아래 명령을 실행합니다.
```
$ source ~/.bashrc
```
##### 3. 작업 디렉토리 생성
- 작업 디렉토리 생성을 위해 아래 명령을 터미널에서 실행합니다.
```
$ mkdir workspace
$ cd workspace
```

##### 4. AVS 인스톨 스크립트 다운로드
- 아래 명령을 터미널에서 실행합니다.
```
$ git clone https://github.com/alexa/alexa-avs-sample-app.git
$ cd alexa-avs-sample-app
$ nano automated_install.sh
```
##### 5. AVS 인스톨 스크립트 수정
- 빨간색 부분을 수정합니다.
![](/assets/avs_script_edit_1.jpg)
- AVS 등록에서 생성한 ProductID, ClientID, ClientSecret 를 사용합니다.  
![](/assets/avs_script_edit_2.jpg)

- 편집이 완료되면 , Ctrl + o 를 누릅니다. 파일이름을 확인하고 Enter키를 누릅니다.  
![](/assets/avs_script_edit_3.jpg)

- 저장이 완료되면 Ctrl + X로 nano 에디터를 종료합니다.
- install 스크립트에 실행 권한을 부여합니다.
```
$ chmod +x automated_install.sh
```
##### 6. MAVEN POM.xml 수정
- DragonBoard410c에서 AVS를 실행하기 위해서는 pom.xml와 pom_pi.xml이 수정되어야 합니다.
```
$ cd /home/linaro/workspace/alexa-avs-sample-app/samples/javaclient
$ nano pom.xml
```
![](/assets/dragonBoard_avs_util_3.png)
- 다음과 같이 변경합니다.
```
<dependency>
    <groupId>uk.co.caprica</groupId>
    <artifactId>vlcj</artifactId>
    <version>3.10.1</version>
</dependency>
```
![](/assets/dragonBoard_avs_util_4.png)
```
$ nano pom_pi.xml
```
![](/assets/dragonBoard_avs_util_5.png)
- 다음과 같이 변경합니다.
```
<dependency>
    <groupId>net.java.dev.jna</groupId>
    <artifactId>jna</artifactId>
    <version>4.2.2</version>
    <scope>compile</scope>
</dependency>
```
![](/assets/dragonBoard_avs_util_6.png)

##### 4. 설치 스트립트를 실행합니다.
- 실행 명령을 입력합니다.
```
$ cd /home/linaro/workspace/alexa-avs-sample-app
$ . automated_install.sh
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

- Alexa wake word 사용에 대해 "n"를 입력하고 Enter를 누릅니다.
![](/assets/avs_script_edit_12.png)

- 설치를 시작합니다. 약 15~20분정도 소요됩니다.  
- 설치가 완료 되면 아래와 같은 화면이 나타납니다.
![](/assets/avs_script_edit_11.jpg)

