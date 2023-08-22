
#Scenario 4
@Regression
Feature: verifying the token
Background:
    Given url "https://tek-insurance-api.azurewebsites.net"
    * def result = callonce read('GenerateToken.feature')
    * def validToken = result.response.token
    * def bearer = "Bearer " + validToken
  Scenario: verifying a valid token
    And path "/api/token/verify"
    And header Authorization = bearer
    And param token = validToken
    And param username = "Supervisor"
    When method get
    Then status 200