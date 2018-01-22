# Alexa for Raspbian\(NOOBS stretch\)

---

이 페이지는 Amazon에서 개발한 Alexa Voice Service를 INS\_VOICE\(가칭\)를 이용하여 사용하는 방법을 기술합니다.

라즈비안을 이용하기 위해서는 아래 가이드를 참고하세요.  
[Raspberry Pi Software Guide](https://www.raspberrypi.org/learning/software-guide/)

[Audio 환경 설정 및 테스트](/../Common/configure-and-test-the-audio.md)를 진행합니다.

작업 디렉토리 생성

```
$ mkdir workspace
$ cd workspace
```

인스톨 스크립트 업데이트

```
$ $ git clone https://github.com/alexa/alexa-avs-sample-app.git
$ cd alexa-avs-sample-app
$ nano automated_install.sh
```

빨간색 부분을 수정합니다.![](/assets/avs_script_edit_1.jpg)

AVS 등록에서 생성한 ProductID, ClientID, ClientSecret 를 사용합니다.  
![](/assets/avs_script_edit_2.jpg)

편집이 완료되면 , Ctrl + O 를 누릅니다. 파일이름을 확인하고 Enter키를 누릅니다.  
![](/assets/avs_script_edit_3.jpg)

저장이 완료되면 Ctrl + X로 nano 에디터를 종료합니다.

install 스크립트에 실행 권한을 부여합니다.

```
chmod +x automated_install.sh
```

스트립트를 실행합니다.

```
. automated_install.sh
```

![](/assets/avs_script_edit_4.jpg)

라이센스 동의에 "y"를 입력하고 Enter를 누릅니다.

![](/assets/avs_script_edit_5.jpg)

사용자 계정을 이미 만들었으므로, "y"를 입력하고 Enter를 누릅니다.

![](/assets/avs_script_edit_6.jpg)

스크립트에 입력한 ProductID, ClientID, ClientSecret가 정확한지 확인합니다.  
문제가 없으면 "y"를 입력하고 Enter를 누릅니다.

![](/assets/avs_script_edit_7.jpg)

사용할 위치에서 "1" US를 선택합니다.

![](/assets/avs_script_edit_8.jpg)

Audio out은 "1" 을 선택합니다.

![](/assets/avs_script_edit_9.jpg)

Alexa wake word 사용에 대해 "y"를 입력하고 Enter를 누릅니다.

![](/assets/avs_script_edit_10.jpg)

설치를 시작합니다. 약 15~20분정도 소요됩니다.  
설치가 완료 되면 아래와 같은 화면이 나타납니다.

![](/assets/avs_script_edit_11.jpg)

