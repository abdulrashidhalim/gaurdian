Feature: create account feature

Background: setup test and genrate token
	#* def result  = callonce read('GenerateToken.feature')
  * def tokenFeaturReslut = callonce read('GenrateToken.feature')
	
	* def validToken = tokenFeaturReslut.response.token
	   Given url "https://tek-insurance-api.azurewebsites.net/"

      
Scenario: create a valid  accounts 
Given path "/api/accounts/add-primary-account"
And header Authorization = "Beare " + validToken
#calling java class is featur file. this utility will create object from java class
* def generateDataObject = Java.type('api.utility.data.GenerateData')
* def autoEmail = generateDataObject.getEmail();
And request 
"""
{
 
  "email": "#(autoEmail)",
  "firstName": "ghul",
  "lastName": "Haroon",
  "title": "MR.",
  "gender": "MALE",
  "maritalStatus": "MARRIED",
  "employmentStatus": "string",
  "dateOfBirth": "2023-08-14T16:28:45.856Z",
  
}
"""
When method post
Then status 201
And print response
And assert response.email == autoEmail
#using delete endpint to remove  generated count of coninuation of execution
#Given path "/api/accounts/delete-account"
#And param primaryPersonId = response.id
#And header Authorization = "Bearer " + validToken
#When method delete
#Then status 200
#And print response
#And assert response == "Account Successfully deleted"

