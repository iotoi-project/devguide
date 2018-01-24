# Alexa for Raspbian\(NOOBS stretch\)

---

이 페이지는 Amazon에서 개발한 Alexa Voice Service를 INS\_VOICE\(가칭\)를 이용하여 사용하는 방법을 기술합니다.

Alexa Voice Service를 구동하기 위해서는 3개의 터미널이 필요합니다.

터미널1: 웹 인증

터미널2: AVS sample app 실행

터미널3: wake word engine

1. 터미널 1을 실행합니다. \(Ctrl + Alt + T\)

```
cd ~/workspace/alexa-avs-sample-app/samples/companionService && npm start
```

![](/assets/raspbian_alexa_step_1.jpg)

2. 터미널 2를 실행합니다.

```
cd ~/workspace/alexa-avs-sample-app/samples/javaclient && mvn exec:exec
```

![](/assets/raspbian_alexa_step_2.jpg)

3. 인증을 위해 디폴트 브라우져를 사용할지 물어본다. "Yes"를 클릭한다.

![](/assets/raspbian_alexa_step_3.jpg)

4. "ADVANCED"를 클릭합니다.

![](/assets/raspbian_alexa_step_4.jpg)

5. "Proceed to localhost \(unsafe\)"를 클릭합니다.

![](/assets/raspbian_alexa_step_5.jpg)

6. Amazon ID 및 Password를 입력하고 Sign in 합니다.

![](/assets/raspbian_alexa_step_6.jpg)

7. 정상적으로 인증 토근을 받으면 아래와 같은 화면이 나타납니다.

![](/assets/raspbian_alexa_step_7.jpg)

8. 브라우져를 닫고, 아래 메시지창에서 "OK"를 클릭합니다.

![](/assets/raspbian_alexa_step_8.jpg)

9. 아래와 같은 화면이 나타나면 정상적으로 AVS sample app이 실행된 것입니다.

![](/assets/raspbian_alexa_step_9.jpg)

10. 터미널 2를 실행합니다. Alexa wake word engine을 실행합니다.

```
$ cd ~/workspace/alexa-avs-sample-app/samples/wakeWordAgent/src && ./wakeWordAgent -e kitt_ai
```

![](/assets/raspbian_alexa_step_10.jpg)

