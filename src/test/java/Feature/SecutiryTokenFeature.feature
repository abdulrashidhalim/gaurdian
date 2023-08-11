Feature: Security Token Tests

Scenario: Genrate valid token with valid user name and password
# prepare request
Given url "https://tek-insurance-api.azurewebsites.net/"
And path "/api/token"
And request { "username": "supervisor","password": "tek_supervisor"}
When method post
Then status 200
And print response



Scenario: validate token with invalid username
Given url "https://tek-insurance-api.azurewebsites.net"
And path "/api/token"
And request { "username": "wrong username ","password": "tek_supervisor"}
When method post
Then status 400
And print response

Scenario: validate token with invalid password
Given url "https://tek-insurance-api.azurewebsites.net/"
And path "/api/token"

And request { "username": "supervisor","password": "wrong password"}
When method delet
Then status 400
And print response