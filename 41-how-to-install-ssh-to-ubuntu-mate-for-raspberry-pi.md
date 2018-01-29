# How to install ssh to Ubuntu Mate 16.04 for Raspberry Pi 3
---
Ubuntu MATE 16.04에 ssh server를 설치하고 실행하는 방법을 기술합니다.

#### ssh 설치
##### 1. Install ssh
- System 소프트웨어를 업데이트 하고, ssh를 설치합니다.
```
$ sudo apt-get update
$ sudo apt-get upgrade
$ sudo apt-get install ssh
```

##### 2. ssh 서비스 등록
- ssh 서버를 상시로 사용하기 위해 systemctl enable '서비스 이름' 명령을 사용합니다.
```
$ sudo systemctl enable ssh
```

##### 2. ssh 서비스 시작
- ssh 서버를 시작합니다.
```
$ sudo systemctl start ssh
$ sudo systemctl status ssh
```

##### 3. IP 확인하기
- IP address 확인하기
```
$ ifconfig
```

#### Terminal을 사용한 접속


##### 1. MAC or Linux에서 접속
- SSH Terminal을 이용하여 Raspberry Pi 3에 접속합니다.
- MAC or Linux에서 ssh로 접속하는 방법
```
/* $ ssh 사용자계정@IP -p SSH 포트 번호 */
$ ssh roy@192.168.15.51 -p 22
```

##### 2. Windows 에서 ssh로 접속하는 방법
- Windows의 경우 별도의 프로그램을 설치해야 합니다.
[Download Putty](https://the.earth.li/~sgtatham/putty/latest/w64/putty.exe)

- putty.exe를 실행합니다.
- Host Name \(or IP address\) 에 Raspberry Pi 3의 IP address를 입력합니다.
- Saved Sessions에 정보를 저장할 이름을 입력하고, Save를 클릭합니다.
- Open을 클릭하면, 입력한 IP address에 접속합니다.
![](/assets/putty_step_1.jpg)

- 아래 안내문구가 나타나면 "Yes"를 선택합니다.
![](/assets/putty_step_2.jpg)

