# How to install ssh to Ubuntu Mate 16.04 for Raspberry Pi 3

1.Install ssh

```
$ sudo apt-get update
$ sudo apt-get upgrade
$ sudo apt-get install ssh
```

1. ssh 서버를 상시로 사용하기 위해 systemctl enable '서비스 이름' 명령을 사용합니다.

```
$ sudo systemctl enable ssh
```

1. ssh 서버를 시작합니다.

```
$ sudo systemctl start ssh
$ sudo systemctl status ssh
```

1. Raspberry Pi IP 확인하기

```
$ ifconfig
```

1. SSH Terminal을 이용하여 Raspberry Pi 3에 접속합니다.

a\) MAC or Linux에서 ssh로 접속하는 방법

사용방법

```
/* $ ssh 사용자계정@IP -p SSH 포트 번호 */
$ ssh roy@192.168.15.51 -p 22
```

```

```

b\) windows 에서 ssh로 접속하는 방법

[Download Putty](https://the.earth.li/~sgtatham/putty/latest/w64/putty.exe)

\(1\) putty.exe를 실행합니다.

\(2\) Host Name \(or IP address\) 에 Raspberry Pi 3의 IP address를 입력합니다.

\(3\) Saved Sessions에 정보를 저장할 이름을 입력하고, Save를 클릭합니다.

\(4\) Open을 클릭하면, 입력한 IP address에 접속합니다.

![](/assets/putty_step_1.jpg)

\(5\) 알래 안내문구가 나타나면 "Yes"를 선택합니다.

![](/assets/putty_step_2.jpg)

