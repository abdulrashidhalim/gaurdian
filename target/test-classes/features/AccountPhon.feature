@regression
Feature: create Account and add Phone Number

  Background: set up Test an Crate Account
    Given url "https://tek-insurance-api.azurewebsites.net/"
    * def creatAccountResult = callonce read('CreateAccount.feature')
    And print creatAccountResult
    * def validToken = creatAccountResult.validToken
    * def createAccountId = creatAccountResult.response.id

  Scenario: Adding phone number to an account
  Given path "/api/accounts/add-account-phone"
  And param primaryPersonId = createAccountId
  And header Authorization = "Bearer " + validToken
  * def dataGenrator = Java.type('api.utility.data.GenerateData')
  * def phoneNumber = dataGenrator.getPhoneNumber()
  And request 
  """
  {
 
  "phoneNumber": "#(phoneNumber)",
  "phoneExtension": "",
  "phoneTime": "evening",
  "phoneType": "mobile"
}
	"""
	When method post
	Then status 201
	And assert response.phoneNumber == phoneNumber
	