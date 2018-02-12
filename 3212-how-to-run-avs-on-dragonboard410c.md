# Alexa for Debian 17.09

---

이 페이지는 Amazon에서 개발한 Alexa Voice Service를 iotoi AFE-DB410C를 이용하여 사용하는 방법을 기술합니다.

#### Alexa Voice Service를 구동하기 위해서는 2개의 터미널이 필요합니다.
- DragonBoard410c용 Debian OS에서는 wake word engine 기능을 사용할 수 없습니다.
```
터미널1: 웹 인증
터미널2: AVS sample app 실행
```

##### 1. 터미널 1 실행 \(Ctrl + Alt + T\)
- 아래 명령을 입력합니다.
```
cd ~/workspace/alexa-avs-sample-app/samples/companionService && npm start
```
![](/assets/dragonBoard_alexa_step_1.png)

##### 2. 터미널 2 실행
- 아래 명령을 입력합니다.
```
cd ~/workspace/alexa-avs-sample-app/samples/javaclient && mvn exec:exec
```
![](/assets/dragonBoard_alexa_step_2.png)

##### 3. 사용자 인증
- URL을 clipboard에 복사할지 물어봅니다. "Yes"를 클릭한다.
![](/assets/dragonBoard_alexa_step_3.png)

- 브라우져를 실행하고, URL에 clipboard에 저장된 URL을 붙여넣기를 합니다.
- ADVANCED 를 클릭합니다.
![](/assets/dragonBoard_alexa_step_4.png)

- "Proceed to localhost \(unsafe\)"를 클릭합니다.
![](/assets/dragonBoard_alexa_step_5.png)

- Amazon ID 및 Password를 입력하고 Sign in 합니다.
![](/assets/dragonBoard_alexa_step_6.png)

- 정상적으로 인증 토근을 받으면 아래와 같은 화면이 나타납니다.
![](/assets/dragonBoard_alexa_step_7.png)

- 브라우져를 닫고, 아래 메시지창에서 "OK"를 클릭합니다.
![](/assets/dragonBoard_alexa_step_8.png)

- 아래와 같은 화면이 나타나면 정상적으로 AVS sample app이 실행된 것입니다.
![](/assets/dragonBoard_alexa_step_9.png)
