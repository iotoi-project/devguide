# Install XRDP for remote desktop server

## Install XRDP
    $ sudo apt install -y xrdp tigervnc-standalone-server

## Change /etc/xrdp/xrdp.ini
```
 --- a/xrdp.ini     2017-06-19 14:05:53.290490260 +0900
 +++ b/xrdp.ini  2017-06-19 14:11:17.788557402 +0900
 @@ -147,15 +147,6 @@ tcutils=true
  ; Session types
  ;
 
 -[Xorg]
 -name=Xorg
 -lib=libxup.so
 -username=ask
 -password=ask
 -ip=127.0.0.1
 -port=-1
 -code=20
 -
  [Xvnc]
  name=Xvnc
  lib=libvnc.so
 @@ -166,6 +157,15 @@ port=-1
  #xserverbpp=24
  #delay_ms=2000
 
 +[Xorg]
 +name=Xorg
 +lib=libxup.so
 +username=ask
 +password=ask
 +ip=127.0.0.1
 +port=-1
 +code=20
 +
  [console]
  name=console
  lib=libvnc.so    
```

## Restart XRDP
 ```
 $ sudo systemctl restart xrdp
 ```


