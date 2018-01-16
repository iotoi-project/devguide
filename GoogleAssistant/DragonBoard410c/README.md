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
  * ### [Install xrdp](./how-to-install-xrdp.md)
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

      Use a[Python virtual environment](https://docs.python.org/3/library/venv.html) to isolate the SDK and its dependencies from the system Python packages.

      \(Recommended\) For Python 3:

      ```
      linaro@linaro-alip:~$ sudo apt-get update
      linaro@linaro-alip:~$ sudo apt-get install python3-dev python3-venv
      linaro@linaro-alip:~$ python3 -m venv env
      linaro@linaro-alip:~$ env/bin/python -m pip install --upgrade pip setuptools
      linaro@linaro-alip:~$ source env/bin/activate
      ```

    * ### Get the package {#get_the_package}

      The Google Assistant SDK package contains all the code required to get the Google Assistant running on the device, including the sample code.
      
      Install the package's system dependencies:

      ```
      (env) linaro@linaro-alip:~$ sudo apt-get install portaudio19-dev libffi-dev libssl-dev
      ```

    * ### Generate credentials {#generate_credentials}

        ##### 1. Install or update the authorization tool:

         ```
         (env) linaro@linaro-alip:~$ python -m pip install --upgrade google-auth-oauthlib[tool]
         ```
  
        ##### 2. vsftp나 scp를 사용하여 client\_secret\_xxx.json 파일을 dragonboard에 upload합니다.
        ##### 3. AAAA

         
          ![](/assets/dragonBoard_google_assistant_step_1.png)
          
          ![](/assets/dragonBoard_google_assistant_step_2.png)
          
          ![](/assets/dragonBoard_google_assistant_step_3.png)
          
          ![](/assets/dragonBoard_google_assistant_step_4.png)
          
![](/assets/dragonBoard_google_assistant_step_5.png)
        
        ##### 4. Install gRPC

          ```
          (env) linaro@linaro-alip:~$ python -m pip install grpcio
          (env) linaro@linaro-alip:~$ python -m pip install grpcio-tools
          (env) linaro@linaro-alip:~$ python -m pip install --upgrade google-assistant-sdk[samples]
          (env) linaro@linaro-alip:~$ googlesamples-assistant-devicetool list --model
          Device Model Id: my-dev-project-model
                  Project Id: marine-outpost-191105
                  Device Type: action.devices.types.LIGHT
          No traits
          ```
  
          ```
          (env) linaro@linaro-alip:~$ git clone https://github.com/googlesamples/assistant-sdk-python
          (env) linaro@linaro-alip:~$ cp -r assistant-sdk-python/google-assistant-sdk/googlesamples/assistant/grpc new-project
          (env) linaro@linaro-alip:~$ cd new-project
          ```

        ##### 5. Run Google Assistant
          Finally, run the push to talk sample. The sample records a voice query after a keypress and plays back the Google Assistant’s answer:
  
            ```
            (env) linaro@linaro-alip:~/new-project$ python -m pushtotalk --device-model-id my-dev-project-model --project-id marine-outpost-191105
            INFO:root:Connecting to embeddedassistant.googleapis.com
            Press Enter to send a new request...
            
            ```



