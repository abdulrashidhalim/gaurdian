Feature: Verify Account

  Background: setup test
    Given url "https://tek-insurance-api.azurewebsites.net/"
    * def result = callonce read('GenrateToken.feature')
    And print result
    * def validtoken = result.response.token
   #Scenario 7
  Scenario: Verify an account that exist
    Given path "/api/accounts/get-account"
    # with def step create a variable and assign value for reusability
    * def existingId = 9777
    And param primaryPersonId = existingId
    #Header have to add to request.
    And header Authorization = "Bearer " + result.response.token
    When method get
    Then status 200
    And print response
    And assert  response.primaryPerson.id == existingId
	#Scenario 8
  Scenario: verify get-account with id not exist
    Given path "/api/accounts/get-account"
    And param primaryPersonId = "97777777"
    #Header have to add to request.
    And header Authorization = "Bearer " + validtoken
    When method get
    Then status 404
    And print response
    And assert response.errorMessage == "Account with id 97777777 not found"
