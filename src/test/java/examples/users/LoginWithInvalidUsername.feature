#Scenario 2
@Regression
Feature: Login with invalid username

  Scenario: Verify user can't login with invalid username and valid password
    Given url "https://tek-insurance-api.azurewebsites.net"
    And path "/api/token"
    And request {"username" :  "wrong username", "password" : "tek_supervisor"}
    When method post
    Then status 400
    And print response
    And assert response.errorMessage == "User not found"