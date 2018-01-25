# How to build customize BSP for Dragon Board 410c

이 페이지는 Dragon Board 410c용 사용자 BSP 빌드 방법을 설명합니다.

#### Micosoft iot-adk-addonkit 다운로드

##### 1. Git clone으로 소스 받기 or
```
git clone https://github.com/ms-iot/iot-adk-addonkit.git
```

##### 2. Github site에서 iot-adk-addonkit 다운로드 받기
- ##### [https://github.com/ms-iot/iot-adk-addonkit](https://github.com/ms-iot/iot-adk-addonkit)

#### MS-IOT GitHub에서 Raspberry Pi BSP 다운로드 받기
* ##### [Windows 10 IoT Core Prebuilt Binaries](https://github.com/ms-iot/iot-adk-addonkit/releases/download/RPiBSP/rpibsp.zip)
* ##### [Windows 10 IoT Core Board Support Package](https://github.com/ms-iot/bsp)

#### iot-adk-addonkit를 이용하여 build 하기

##### 1. iot-adk-addonkit에 "QualcommBSPCabs" 폴더를 생성합니다.
- 다운받은 prebuilt 파일(rpibsp.zip)을 압축해제 합니다.
![](/assets/rpi3_bsp_build_step_1.png)

##### 2. iot-adk-addonkit을 이용하여 이미지 빌드하기
- Tool\setOEM.cmd 파일을 수정합니다.
![](/assets/rpi3_bsp_build_step_2.png)
![](/assets/rpi3_bsp_build_step_3.png)

- IoTCoreShell.cmd를 administrator로 실행합니다.
![](/assets/rpi3_bsp_build_step_4.png)

- Architecture에서 "1 for ARM"을 선택합니다.
- 만약 빨간색 부분의 정보가 일치하지 않거나 정상적인 버전이 나타나지 않으면 설치환경을 확인하세요.
![](/assets/rpi3_bsp_build_step_5.png)

- test certificates를 설치합니다. \(이 명령은 최초 한번만 실행하면 됩니다.\)
```
InstallOEMCerts
```
[](/assets/rpi3_bsp_build_step_6.png)

- rpibsp 폴더로 이동합니다. PreBuilt BSP를 빌드 합니다.
```
build.cmd
```
![](/assets/rpi3_bsp_build_step_7.png)

- Raspberry Pi용 prebuilt BSP가 빌드되면 작업 풀더에 모든 패키지를 빌드합니다.
```
buildpkg All
```
![](/assets/rpi3_bsp_build_step_8.png)

- Raspberry Pi용 프로덕트를 생성합니다.
```
newproduct ProductA rpi2
```
![](/assets/rpi3_bsp_build_step_9.png)

- Cortana feature를 추가합니다.
    
- 아래 경로의 "TestOEMInput.xml" 파일을 notepad를 이용하여 Open합니다.
![](/assets/rpi3_bsp_build_cortana_step_1.png)
    
- IOT_CORTANA를 추가하고, 저장합니다.
![](/assets/rpi3_bsp_build_cortana_step_2.png)

- 이미지를 빌드합니다. \(이미지 빌드 시간은 약 30분 정도 소요됩니다.\)
```
buildimage ProductA test
```
![](/assets/rpi3_bsp_build_step_10.png)

- 이미지 빌드 완료
윈도우 탐색기를 이용하여 아래 경로로 이동하면 생성된 Windows 10 IoT Core 이미지가 있습니다.
 ![](/assets/rpi3_bsp_build_step_11.png)

##### 3. 생성된 이미지를 Raspberry Pi에 다운로드 하는 방법은 다음과 같습니다.
- Micro SD 카드를 소켓등을 이용하여 PC에 연결합니다.
- Windows 10 IoT Core Dashboard를 실행합니다.  
- 왼쪽 메뉴바에서 Set up a new device를 선택합니다.
![](/assets/rpi3_bsp_download_step_1.png)
- Device Type에서 Custom을 선택합니다.
![](/assets/rpi3_bsp_download_step_2.png)
- Browse 를 클릭하여 build한 바이너리를 선택합니다.
![](/assets/rpi3_bsp_download_step_3.png)
- Drive에서 연결한 Micro SD 카드를 지정합니다.
![](/assets/rpi3_bsp_download_step_4.png)
- New Administrator Password를 설정합니다.
- I accept the software license terms를 체크합니다.
- Install을 클릭합니다.  
![](/assets/rpi3_bsp_download_step_5.png)
- 바이너리 flashing이 완료되면 Micro SD 카드를 Raspberry Pi에 장착하고 전원을 연결합니다.

-----
## Reference

* #### [Microsoft IoT Core manufacturing guide](https://docs.microsoft.com/ko-kr/windows-hardware/manufacture/iot/create-a-basic-image?f=255&MSPPError=-2147217396.)

* #### [Microsoft IoT Core feature list](https://inslab.jira.com/wiki/spaces/CWD/pages/190873601/IoT+Core+feature+list)

