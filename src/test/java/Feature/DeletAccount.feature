Feature: Delet account Fanctionality

Scenario:  successfull Delet account
#Account should be exist to delete. 200 status code
# make sure account that is not exist to get 404 status code

Given url "https://tek-insurance-api.azurewebsites.net/"
And path "/api/accounts/delete-account
And param primaryPersonId = "9777"
When method delete
Then status 200

