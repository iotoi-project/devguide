# How to build customize BSP for Dragon Board 410c

이 페이지는 Dragon Board 410c용 사용자 BSP 빌드 방법을 설명합니다.

## Micosoft iot-adk-addonkit 다운로드

#### Git clone으로 소스 받기

```
git clone https://github.com/ms-iot/iot-adk-addonkit.git
```

#### Github에서 iot-adk-addonkit 다운로드 받기
  [https://github.com/ms-iot/iot-adk-addonkit](https://github.com/ms-iot/iot-adk-addonkit)

#### Qualcomm Developer network에서 BSP 추가 부분 다운로드 받기 \(계정 필요\)
  [Windows 10 IoT Core Board Support Package](https://developer.qualcomm.com/download/db410c/windows-10-iot-core-bsp.zip)

#### iot-adk-addonkit에 Qualcomm BSP 추가하기

##### 1. iot-adk-addonkit에 "QualcommBSPCabs" 폴더를 생성합니다.
- 다운받은 Qualcomm BSP 파일을 압축해제 합니다.
- 윈도우 탐색기에서 검색하기를 이용하여, BSP에 포함된 모든 cab 파일을 찾습니다.
- 검색된 모든 cab 파일을 "QualcommBSPCabs"에 복사합니다.
![](/assets/dragonBoard_bsp_build_step_1.png)

##### 2. iot-adk-addonkit을 이용하여 이미지 빌드하기
- Tool\setOEM.cmd 파일을 수정합니다.
![](/assets/dragonBoard_bsp_build_step_2.png)
![](/assets/dragonBoard_bsp_build_step_3.png)

- IoTCoreShell.cmd를 administrator로 실행합니다.
![](/assets/dragonBoard_bsp_build_step_4.png)

- Architecture에서 "1 for ARM"을 선택합니다.
- 만약 빨간색 부분의 정보가 일치하지 않거나 정상적인 버전이 나타나지 않으면 설치환경을 확인하세요.
![](/assets/dragonBoard_bsp_build_step_5.png)

- test certificates를 설치합니다. 이는 최초 한번만 실행하면 됩니다.
```
InstallOEMCerts
```
![](/assets/dragonBoard_bsp_build_step_6.png)

- 인증서가 정상적으로 설치되면 작업 풀더에 모든 패키지를 빌드합니다.
```
buildpkg All
```
![](/assets/dragonBoard_bsp_build_step_7.png)

- DragonBoard410c용 프로적트를 생성합니다. SMBIOS 를 제공할 것이냐는 질문에 "N"로 합니다.
```
newproduct SBC QCDB410C
```
![](/assets/dragonBoard_bsp_build_step_8.png)

- Cortana feature를 추가합니다.
    
- 아래 경로의 "TestOEMInput.xml" 파일을 notepad를 이용하여 Open합니다.
![](/assets/dragonBoard_bsp_build_cortana_step_1.png)
    
- IOT_CORTANA를 추가하고, 저장합니다.
![](/assets/dragonBoard_bsp_build_cortana_step_2.png)

- 이미지를 빌드합니다. \(이미지 빌드 시간은 약 30분 정도 소요됩니다.\)
```
buildimage SBC test
```
![](/assets/dragonBoard_bsp_build_step_9.png)

- 이미지 빌드 완료
윈도우 탐색기를 이용하여 아래 경로로 이동하면 생성된 Windows 10 IoT Core 이미지가 있습니다.
![](/assets/dragonBoard_bsp_build_step_10.png)

- 생성된 이미지를 DragonBoard에 다운로드 하는 방법은 아래 링크를 참고하세요.
  [How to download bsp to DragonBoard 410c](../how-to-download-binary.md)

-----
## Reference

* #### [Microsoft IoT Core manufacturing guide](https://docs.microsoft.com/ko-kr/windows-hardware/manufacture/iot/create-a-basic-image?f=255&MSPPError=-2147217396.)

* #### [Microsoft IoT Core feature list](https://inslab.jira.com/wiki/spaces/CWD/pages/190873601/IoT+Core+feature+list)

