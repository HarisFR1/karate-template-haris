#Scenario 5
@Regression
Feature: Verify token with invalid username

  Scenario: Validate a valid token and invalid username
    Given url "https://tek-insurance-api.azurewebsites.net"
    And path "/api/token"
    And request {"username" : "supervisor", "password": "tek_supervisor"}
    When method post
    Then status 200
    And print response
    Then path "/api/token/verify"
    And param username = "WrongUsername"
    And param token = response.token
    When method get
    Then status 400
    And print response
    And assert response.errorMessage == "Wrong Username send along with Token"