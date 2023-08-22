#Scenario 6
@Regression
Feature: validation

  Scenario: verify that user is be able to log in with a valid P and UN
    Given url "https://tek-insurance-api.azurewebsites.net"
    And path "/api/token/verify"
    And param token = "wrong token"
    And param username = "Supervisor"
    When method get
    Then status 400
    And print response
    And assert response.errorMessage == "Token Expired or Invalid Token"