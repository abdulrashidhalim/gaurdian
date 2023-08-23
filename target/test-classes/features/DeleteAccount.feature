#Account should be exist to delete, 200 status code
# Make sure Account that is not exist to get 404 code
@regression
Feature: Delete account fucnaitonality

Background: Test setup (genrate token) and Create New Account


* def createAccount = callonce read('CreateAccount.feature')
* def validToken = createAccount.validToken
* def createAccountID = createAccount.response.id
And print createAccount
Given url "https://tek-insurance-api.azurewebsites.net/"

Scenario: successfully delete account  
Given path "/api/accounts/delete-account"

And param primaryPersonId = createAccountID
And header Authorization = "Bearer " + validToken
When method delete
Then status 200
And assert response == "Account Successfully deleted"
Given path "/api/accounts/delete-account"
And param primaryPersonId = createAccountID
And  header Authorization = "Bearer " + validToken
When method delete
Then status 404
And assert response.errorMessage == "Account with id " + createAccountID + " not exist"



