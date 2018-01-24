# Install vsftpd

```
$ sudo apt-get update
$ sudo apt-get install vsftpd
```

기본설정 파일을 백업해 둔다.

```
$ sudo cp /etc/vsftpd.conf /etc/vsftpd.conf.orig
```

특정 User의 local shell에서 FTP 사용할 수 있도록 설정하기

```
$ sudo vim /etc/vsftpd.conf
```

파일을 열어서 아래와 같이 해당하는 부분들의 값들을 설정한다.

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

FTP를 허용해줄 사용자를 _/etc/vsftpd.userlist _에 추가한다.

```
$ echo "linaro" | sudo tee -a /etc/vsftpd.chroot_list
$ cat /etc/vsftpd.chroot_list
linaro
```

설정이 완료됐으면 vsftpd를 재시작 한다.

```
$ sudo systemctl restart vsftpd
```



