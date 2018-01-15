# How to install Google Assistant for Dragon Board 410c

이 페이지는 Dragon Board 410c에 Google Assistant 설치를 설명합니다.

* ## OS 버전

  * ### [Debian 17.04.1 download](http://builds.96boards.org/releases/dragonboard410c/linaro/debian/17.04.1/dragonboard410c_sdcard_install_debian-246.zip)
  * ### This method requires the following hardware:

    * #### DragonBoard 410c with power supply
    * #### Host machine \(Linux, Mac OS X, or Windows\)
    * #### MicroSD card with 4GB or more of storage
    * #### USB Mouse and/or keyboard
    * #### HDMI Monitor with full size HDMI cable
* ## Install Debian 17.04.1

  * ### [Etcher download](https://etcher.io/)
  * ### Install etcher
  * ### Run etcher
  * ### Select debian 17.04.1 binary
  * ### Insert microSD to DragonBoard 410c
  * ### Change DIP switch as a SD Boot

    ![](/assets/dragonBoard410c_junper_sdboot.png)
  * ### Connect Power supply to DragonBoard 410c
  * ### Install Debian 17.04.1
* ## Install utilities

  * ### Install ssh
    ```
    sudo apt-get install ssh
    ```
  * ### [Install xrdp](./DragonBoard410c/how-to-install-xrdp.md)

* ## Install Google Assistant

  * Run 



