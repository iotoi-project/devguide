# Alexa for Ubuntu 16.04

---

이 페이지는 Amazon에서 개발한 Alexa Voice Service를 INS\_VOICE\(가칭\)를 이용하여 사용하는 방법을 기술합니다.

#### Ubuntu MATE 16.04 for Raspberry 
[Download Ubutu Mate 16.04 for Raspberry Pi 3](https://ubuntu-mate.org/download/)

#### 필요한 물품
- Raspberry Pi 3
- Micro SD card
- Micro USB power supply \(2.1 A\)
- TV or monitor and HDMI cable
- Keyboard and mouse

#### Ubuntu MATE 16.04 설치

##### 1. 다운받은 Ubutu Mate 16.04 이미지 압축 해제

##### 2. 이미지를 굽는 프로그램을 다운받아 설치
[Download etcher](https://etcher.io/)

##### 3. Micro SD Card를 PC에 장착

##### 4. Etcher 프로그램을 실행
- Select Image를 클릭하고, 다운받은 Ubuntu Mate 16.04 이미지\(ubuntu-mate-16.04.2-desktop-armhf-raspberry-pi.img\)를 선택합니다
- Select drive를 클릭하여, Micro SD Card의 경로를 설정합니다.
- Flash 를 클릭합니다.
- 이미지 flash가 모두 끝나면, Micro SD Card를 PC에서 분리하여 준비한 Raspberry Pi 3에 창작합니다.
- 준비한 모니터와 키보드, 마우스를 Raspberry Pi 3에 연결합니다.
- Micro USB power supply를 Raspberry Pi 3에 연결합니다.
- Ubuntu Mate 16.04를 설치합니다. \(ID: roy, Computer Name: RPi3\)
- SSH 를 설치합니다.
- 필요한 경우, XRDP를 설치합니다.
- Raspberry Pi에 접속합니다.
- 설치된 Java version을 확인합니다.
```
$ java -version
openjdk version "1.8.0_151"
OpenJDK Runtime Environment (build 1.8.0_151-8u151-b12-0ubuntu0.16.04.2-b12)
OpenJDK Client VM (build 25.151-b12, mixed mode)
```



