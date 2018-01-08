# Gitbook으로 문서 작성하는 방법
### Prerequisites
git
Markdown editor (including Gitbook editor)

### 저장소 권한이 있는 경우
##### 1. Clone devguide repository
아래의 command로 clone 한다. SSH로 clone해도 되지만 gitbook editor를 사용하는 경우 origin이 https인 경우에만 editor에서 push 등의 작업이 가능하기 때문에 https로 clone 하는 것을 추천
```bash
git clone https://github.com/iotoi-project/devguide
```

##### 2. 문서 작성 및 편집
Markdown으로 문서를 작성한다. 작성법은 [한국어 도움말][help-korean] 참조

##### 3. Save & Publish
문서 작성이 완료되면 Save 버튼을 누르고 Publish 하면 되는데 사전에 commit message 자동 생성 기능이 꺼져있는게 좋다. Commit message가 editor에 의해 자동 생성되면 단순하게 '어느 파일이 업데이트 되었다' 정도의 수준으로만 기록되기 때문에 의미가 없다. Commit message 자동 생성을 끄는 방법은 아래 내용 참조

  (1) 화면 우측 하단의 **'물음표'** 버튼 클릭 후 Settings 클릭
  ![](/assets/question_button.png)
  
  (2) GIT 탭에서 **Automatically generate...** 부분을 선택해제
  ![](/assets/disable_auto_commit_msg.png)

### 저장소 권한이 없는 경우
##### 1. Fork
[저장소][devguide-repo]에 가서 우측 상단의 Fork 버튼을 눌러서 본인의 저장소로 fork를 뜬다.

##### 2. 문서 작성 및 편집
저장소 권한이 있는 경우와 동일한 방법으로 작성한다.

##### 3. Save & Publish
저장소 권한이 있는 경우와 동일한 방법으로 작성한다.

##### 4. Pull Request
본인의 저장소에 push가 된 경우 원래 저장소와 본인의 저장소 상태가 다른데 원래 저장소에 본인이 추가/수정한 내용을 반영하고 싶다면 아래 그림처럼 파일 리스트 좌측 위에 붙어있는 **New Pull Request** 버튼을 눌러 pull request를 생성한다. 이후 나머지 과정은 원본 저장소에 권한이 있는 사용자가 진행하게 된다.
![](/assets/pull_request.png)


[help-korean]: https://bluekms21.gitbooks.io/gitbookhelp_kr/content/
[devguide-repo]: https://github.com/iotoi-project/devguide
