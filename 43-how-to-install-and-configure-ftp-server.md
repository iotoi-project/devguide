# How to Install and Configure FTP Server
---

#### 지원 OS
- Raspbian for Raspberry Pi
- Ubuntu MATE 16.04 for Raspberry Pi
- Debian 17.04 for DragonBoard 410c

#### 설치
##### 1. Installing VsFTP Server 
```
$ sudo apt-get update
$ sudo apt-get install vsftpd
```
##### 2. 기본설정 파일 백업
```
$ sudo cp /etc/vsftpd.conf /etc/vsftpd.conf.orig
```

##### 3. 환경 파일 편집
 
```
$ sudo vim /etc/vsftpd.conf
```

```
...

# Allow anonymous FTP? (Disabled by default).
anonymous_enable=NO
#
# Uncomment this to allow local users to log in.
local_enable=YES

...

write_enable=YES
```

지정된 사용자만 접속할 수 있도록 설정한다.
```
chroot_local_user=YES
chroot_list_enable=YES
chroot_list_file=/etc/vsftpd.chroot_list
```

##### 4. 사용자 추가
FTP를 허용해줄 사용자를 _/etc/vsftpd.userlist _에 추가한다.
```
$ echo user_asscount | sudo tee -a /etc/vsftpd.chroot_list
$ cat /etc/vsftpd.chroot_list
user_account
```

##### 5. vsftp 재시작
```
$ sudo systemctl restart vsftpd
```



