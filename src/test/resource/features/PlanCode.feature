@regression
Feature: plan code featur


Background: setup test and get valid token
      Given url "https://tek-insurance-api.azurewebsites.net/"

    * def tokenFeaturReslut = callonce read('GenrateToken.feature')
     * def validtoken = tokenFeaturReslut.response.token
    

Scenario: Validat get-all-plan-code
And path "/api/plans/get-all-plan-code"
And header Authorization = "Bearer " + validtoken
When method get
Then status 200
And print response
And assert response [0].planExpired == false
And assert response [1].planExpired == false
And assert response [2].planExpired == false
And assert response [3].planExpired == false

