Feature: Verify Account

Background: setup test
Given url "https://tek-insurance-api.azurewebsites.net/"

Scenario: Verify an account that exist
And path "/api/token"
And request {"username" : "supervisor" , "password" : "tek_supervisor"}
When method post
Then status 200
And print response
Given path "/api/accounts/get-account"
# with def step create a variable and assign value for reusability
* def existingId = 9777
And param primaryPersonId = existingId
#Header have to add to request.
And header Authorization = "Bearer " + response.token
When method get
Then status 200
And print response
And assert  response.primaryPerson.id == existingId

Scenario: verify get-account with id not exist

And path "/api/token"
And request {"username" : "supervisor" , "password" : "tek_supervisor"}
When method post
Then status 200
And print response

Given path "/api/accounts/get-account"
And param primaryPersonId = "97777777"
#Header have to add to request.
And header Authorization = "Bearer " + response.token
When method get
Then status 404
And print response
And assert response.errorMessage == "Account with id 97777777 not found"