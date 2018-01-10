# Cortana for Windows 10 IoT Core

이 페이지는 Microsoft에서 개발한 Cortana 음성인식을 INS\_VOICE\(가칭\)를 이용하여 사용하는 방법을 기술합니다.

지원보드

* Dragon Board 410c
* Raspberry Pi 2/3

## Windows 10 IoT Core BSP 환경 설정

**이 문서는 Windows 10 Version 1709 OS Build 16299.192 기준으로 작성되었습니다.**

**아래 소프트웨어를 다운 받을 때, 버전 1709로 다운로드하여 설치해야 합니다.**

![](/assets/Windows_specifications.png)

```
Tip!
Windows 10 IoT Core BSP 환경은 Oracle VirtualBox와 같은 프로그램을 이용하여 격리된 환경에 설치하기를 권장합니다.
Windows 10 IoT Core BSP 빌드에 필요한 소프트웨어는 윈도우 업데이트 또는 다른 소프트웨어 설치에 따라 영향을 받을 수 있습니다.
이는 알 수 없는 빌드 실패로 초래할 수 있습니다. 따라서, 빌드 전용 환경을 별도로 구축하는 것을 추천합니다.
```

 

### 소프트웨어 다운로드

* [Visual Studio Community 2017](https://www.visualstudio.com/downloads/?utm_source=mscom&utm_campaign=msdocs)
* [Windows Assessment and Deployment Kit \(ADK\)](https://developer.microsoft.com/en-us/windows/hardware/windows-assessment-deployment-kit)
* [Windows SDK](https://developer.microsoft.com/en-us/windows/downloads/windows-10-sdk)
* [Windows Driver Kit \(WDK\)](https://developer.microsoft.com/en-us/windows/hardware/windows-driver-kit)
* [Windows 10 IoT Core Packages – Build 16299](https://www.microsoft.com/en-us/software-download/windows10iotcore)
* [Windows 10 IoT Core Dashboard](https://docs.microsoft.com/en-us/windows/iot-core/connect-your-device/IoTDashboard)

### 소프트웨어 설치

#### \# Visual Studio 2017 설치

![](/assets/Visual_Studio_Install_Options_1.png)

![](/assets/Visual_Studio_Install_Options_2.png)

#### \# Windows Assessment and Deployment Kit \(ADK\) 설치

* Install default options

#### \# Windows SDK 설치

* Install default options

#### \# Windows Driver Kit \(WDK\) 설치

* Install default options

#### \# Windows 10 IoT Core Packages 설치

* Install default options

#### \# Windows 10 IoT Core Dashboard 설치

* Install default options



