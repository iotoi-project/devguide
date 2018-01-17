# How to install Google Assistant for Dragon Board 410c

이 페이지는 Dragon Board 410c에 Google Assistant 설치를 설명합니다.

* ## OS 버전

  * ### [Debian 17.04.1 download](http://builds.96boards.org/releases/dragonboard410c/linaro/debian/17.04.1/dragonboard410c_sdcard_install_debian-246.zip)
  * ### This method requires the following hardware:

    * ##### DragonBoard 410c with power supply
    * ##### Host machine \(Linux, Mac OS X, or Windows\)
    * ##### MicroSD card with 4GB or more of storage
    * ##### USB Mouse and/or keyboard
    * ##### HDMI Monitor with full size HDMI cable
* ## Install Debian 17.04.1

  ##### 1. [Etcher download](https://etcher.io/)

  ##### 2. Install etcher

  ##### 3. Run etcher

  ##### 4. Select debian 17.04.1 binary

  ##### 5. Insert microSD to DragonBoard 410c

  ##### 6. Change DIP switch as a SD Boot

  ![](/assets/dragonBoard410c_junper_sdboot.png)

  ##### 7. Connect Power supply to DragonBoard 410c

  ##### 8. Install Debian 17.04.1

* ## Install utilities

  * ### Install ssh

    ```
    sudo apt-get install ssh
    ```
  * ### [Install xrdp](./how-to-install-xrdp.md)
  * ### IP 확인하기

  ```
  linaro@linaro-alip:~$ /sbin/ifconfig
  enx00e04c6713e0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
          inet 192.168.15.60  netmask 255.255.255.0  broadcast 192.168.15.255
          inet6 fe80::7f73:9e2b:ead8:caf8  prefixlen 64  scopeid 0x20<link>
          ether 00:e0:4c:67:13:e0  txqueuelen 1000  (Ethernet)
          RX packets 163097  bytes 233053413 (222.2 MiB)
          RX errors 0  dropped 0  overruns 0  frame 0
          TX packets 29429  bytes 2130446 (2.0 MiB)
          TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

  lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
          inet 127.0.0.1  netmask 255.0.0.0
          inet6 ::1  prefixlen 128  scopeid 0x10<host>
          loop  txqueuelen 1  (Local Loopback)
          RX packets 16  bytes 1400 (1.3 KiB)
          RX errors 0  dropped 0  overruns 0  frame 0
          TX packets 16  bytes 1400 (1.3 KiB)
          TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

  wlan0: flags=4099<UP,BROADCAST,MULTICAST>  mtu 1500
          ether 02:00:36:d9:2e:50  txqueuelen 1000  (Ethernet)
          RX packets 0  bytes 0 (0.0 B)
          RX errors 0  dropped 0  overruns 0  frame 0
          TX packets 0  bytes 0 (0.0 B)
          TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

  linaro@linaro-alip:~$
  ```
* ## Install Google Assistant

  * ### [Introduction to the Google Assistant Libaray](https://developers.google.com/assistant/sdk/guides/library/python/?hl=ko)

    * #### Configure and Test the Audio

      Verify that recording and playback work. You can do this in the system sound settings or from the command line.

      ##### 1. Play a test sound \(this will be a person speaking\). Press Ctrl+C when done. If you don't hear anything when you run this, check your speaker connection.

      ```
         speaker-test -t wav
      ```

      ##### 2. Record a short audio clip.

      ```
         arecord --format=S16_LE --duration=5 --rate=16000 --file-type=raw out.raw
      ```

      ##### 3. Check the recording by replaying it.

      ```
         aplay --format=S16_LE --rate=16000 out.raw
      ```

      ##### 4. Adjust the playback and recording volume.

      ```
         alsamixer
      ```
  * ## [Configure a Developer Project and Account Settings](https://developers.google.com/assistant/sdk/guides/library/python/embed/config-dev-project-and-account?hl=en)

    * ## Install the SDK and Sample Code

      * ### Configure a new Python virtual environment

        Use a [Python virtual environment](https://docs.python.org/3/library/venv.html) to isolate the SDK and its dependencies from the system Python packages.

        \(Recommended\) For Python 3.

        ```
        linaro@linaro-alip:~$ sudo apt-get update
        linaro@linaro-alip:~$ sudo apt-get install python3-dev python3-venv
        linaro@linaro-alip:~$ python3 -m venv env
        linaro@linaro-alip:~$ env/bin/python -m pip install --upgrade pip setuptools
        linaro@linaro-alip:~$ source env/bin/activate
        ```

      * ### Get the package {#get_the_package}

        The Google Assistant SDK package contains all the code required to get the Google Assistant running on the device, including the sample code.

        Install the package's system dependencies.

        ```
        (env) linaro@linaro-alip:~$ sudo apt-get install portaudio19-dev libffi-dev libssl-dev
        ```

      * ### Generate credentials {#generate_credentials}

        ##### 1. Install or update the authorization tool

        ```
           (env) linaro@linaro-alip:~$ python -m pip install --upgrade google-auth-oauthlib[tool]
        ```

        ##### 2. vsftp나 scp를 사용하여 client\_secret\_xxx.json 파일을 dragonboard에 upload합니다.

        [How to install vsftpd](./how-to-install-vsftpd.md)

        ##### 3. Generate credentials to be able to run the sample code and tools. You may need to copy it the device. _** Do not rename this file. **_

        ```
        (env) linaro@linaro-alip:~$ google-oauthlib-tool --client-secrets /home/linaro/client_secret_XXXXXX.apps.googleusercontent.com.json --scope https://www.googleapis.com/auth/assistant-sdk-prototype --save --headless
        ```

        Step 1\) Please visit this URL to authorize this application 뒤에 나오는 URL을 복사하여 브라우져를 이용하여 접속합니다.

        ![](/assets/dragonBoard_google_assistant_step_1.png)

        Step 2\) 가지고 있는 google 계정을 입력하고 "NEXT"를 클릭합니다.

        ![](/assets/dragonBoard_google_assistant_step_2.png)

        Step 3\)  패스워드를 입력하고 "NEXT" 클릭합니다.

        ![](/assets/dragonBoard_google_assistant_step_3.png)

        Step 4\) 새로 생성한 "Google Assistant for db410" 프로젝트에 대해 계정 접근을 허용합니다. "ALLOW"를 클릭합니다.

        ![](/assets/dragonBoard_google_assistant_step_4.png)
        
        Step 5\) 생성된 코드를 복사합니다.
        
        ![](/assets/dragonBoard_google_assistant_step_5.png)
        
        Step 6\) 복사한 코드를 terminal에 복사합니다.
       
        ![](/assets/dragonBoard_google_assistant_step_6.png)

    * ##### 4. Install gRPC

    ```
    (env) linaro@linaro-alip:~$ python -m pip install grpcio
    (env) linaro@linaro-alip:~$ python -m pip install grpcio-tools
    (env) linaro@linaro-alip:~$ python -m pip install --upgrade google-assistant-sdk[samples]
    (env) linaro@linaro-alip:~$ googlesamples-assistant-devicetool list --model
    Device Model Id: my-dev-project-model
            Project Id: marine-outpost-191105
            Device Type: action.devices.types.LIGHT
    No traits

    (env) linaro@linaro-alip:~$ git clone https://github.com/googlesamples/assistant-sdk-python
    (env) linaro@linaro-alip:~$ cp -r assistant-sdk-python/google-assistant-sdk/googlesamples/assistant/grpc new-project
    (env) linaro@linaro-alip:~$ cd new-project
    ```

    ##### 5. Run Google Assistant

    Finally, run the push to talk sample. The sample records a voice query after a keypress and plays back the Google Assistant’s answer.

    ```
    (env) linaro@linaro-alip:~/new-project$ python -m pushtotalk --device-model-id my-dev-project-model --project-id marine-outpost-191105
    INFO:root:Connecting to embeddedassistant.googleapis.com
    Press Enter to send a new request...
    ```



