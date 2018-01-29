# How to create new project to Google Cloud Platform
---
[Google original page](https://developers.google.com/assistant/sdk/guides/library/python/embed/config-dev-project-and-account?hl=en)

#### Configure a Developer Project and Account Settings
- A Google Developer Project gives your device access to the Google Assistant API. The project tracks quota usage and gives you valuable metrics for the requests made from your device.

- In the Cloud Platform Console, go to the Projects page. Select an existing project or create a new project.

   [Go to the projects page](https://console.cloud.google.com/cloud-resource-manager?hl=en)

   ##### 1. 프로젝트 이름을 입력 한 후, "생성" 버튼을 클릭합니다.
   ![](/assets/google_cloud_step_1.png)
   
   ##### 2. Select a project을 클릭합니다.
   ![](/assets/google_cloud_step_2.png)
   
   ##### 3. 스텝 a에서 만든 프로젝트를 선택합니다.
   ![](/assets/google_cloud_step_3.png)
   
   ##### 4. search box에서 "google assistant"를 입력합니다.
   ![](/assets/google_cloud_step_4.png)
   
   ##### 5. 검색된 결과를 클릭합니다.
   ![](/assets/google_cloud_step_5.png)
   
   ##### 6. Google Assistant API를 enable 시킵니다.
   ![](/assets/google_cloud_step_6.png)

#### 인증을 위한 OAuth Client ID를 만듭니다. 아래 링크를 클릭하세요.  
 [Create an oauth client ID](https://console.developers.google.com/apis/credentials/oauthclient?hl=en)
##### 1. 동의화면구성
- "동의화면구성"을 클릭합니다.
![](/assets/google_cloud_step_7.png)

##### 2. 프로젝트 이름 지정
- 사용자에게 보일 프로젝트 이름을 입력합니다.
![](/assets/google_cloud_step_8.png)

##### 3. 프로젝트 저장
- 입력을 완료 하면 화면 하단으로 내려가서 "저장"을 클릭합니다.
![](/assets/google_cloud_step_9.png)

##### 4. 어플리케이션 타입 지정
- 어플리케이션 타입에서 "Other"를 선택한 후, 이름을 입력하고, "생성"을 클릭합니다.
![](/assets/google_cloud_step_10.png)

##### 5. OAuth client
- OAuth client 창이 나타나면서 client ID와 client secret이 표시됩니다. "OK"를 클릭합니다.
![](/assets/google_cloud_step_11.png)

##### 6. JSON 다운로드
- 생성된 json 파일을 PC에 다운로드 받습니다.
![](/assets/google_cloud_step_12.png)

