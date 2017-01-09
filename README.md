### Security services implementation from repo below:
https://github.com/gxvigo/apic-security-services

## Portal on Bluemix
-  app: Fintech OAuth
  -  clientID: 5183092f-f486-46da-8468-d32c65980417
  -  secret: sY0vC0qY0aY8vG5oW7xH8uK1mP7pR2pR4vF3fM8tK3uB8bY8jW 


## Portal on my Mac
-  app: Fintech
  -  clientID: ab9b3671-bfb0-4d08-b954-f00693a69c75
  -  secret: xX0aI6nQ4qN8cE2jD8wF3vC0xN5mL4oI3bO2pE2yE2tN4eC7eR
  - OAuth redirect URL: http://192.168.225.1:3080/clientOAuthRedirectionURL


Authenticatin URL: http://apic-security-services.au-syd.mybluemix.net/authenticate
(always return 200 unless user 'wrong' is passed)



## Request Access Token - Bluemix
https://api.au.apiconnect.ibmcloud.com/giovanninzibmcom-dev/sb/oauth-end/oauth2/authorize?response_type=code&redirect_uri=https://example.com/redirect&scope=view_branches&client_id=5183092f-f486-46da-8468-d32c65980417


## API OAuth requesting access token - on my Mac (API Branches confidential-accessCode)

  - initial request:
    https://api.think.ibm/sales/sb/oauth-end/oauth2/authorize?response_type=code&redirect_uri=http://192.168.225.1:3080/clientOAuthRedirectionURL&scope=view_branches&client_id=ab9b3671-bfb0-4d08-b954-f00693a69c75

  - follow the flow in the browser (authentication login, authorization)
  
  - with the code got from previous step send a token request:  
    curl -v -k -u Client_ID:Client_Secret -X POST -d 'grant_type=authorization_code&redirect_uri=Redirect_URL&code=Authorization_Code' 'Token_Endpoint_URL'
    curl -v -k -u ab9b3671-bfb0-4d08-b954-f00693a69c75:xX0aI6nQ4qN8cE2jD8wF3vC0xN5mL4oI3bO2pE2yE2tN4eC7eR -X POST -d 'grant_type=authorization_code&redirect_uri=http://192.168.225.1:3080/clientOAuthRedirectionURL&code=AAJ6mlifRzt0wrY94VL44JoS-q2eHfxhHBjBirKoGem1Gr67jENh5qS8HGfSugbyDb3uyQFH0pYPTM6RjIKC6PgD-n5SMqVQBtFbRmpQWfDaEA' 'https://api.think.ibm/sales/sb/oauth-end/oauth2/token'
  


## API OAuth requesting access token - on my Mac (API Branches confidential-application)

In this flow there's not user authentication involved, just clientId and secret

  - token request:  
    curl -v -u Client_ID:Client_Secret -k -X POST -d {} 'Token_Endpoint_URL?grant_type=client_credentials&scope=Scope'  
    curl -v -u ab9b3671-bfb0-4d08-b954-f00693a69c75:xX0aI6nQ4qN8cE2jD8wF3vC0xN5mL4oI3bO2pE2yE2tN4eC7eR -k -X POST -d {} 'https://api.think.ibm/sales/sb/oauth-end/oauth2/token?grant_type=client_credentials&scope=view_branches_confApp'


