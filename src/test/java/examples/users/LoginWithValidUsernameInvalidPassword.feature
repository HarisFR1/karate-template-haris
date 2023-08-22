#Scenario 3
@Regression
Feature: Login with valid username and invalid password

  Scenario: Verify user can login with valid username and invalid password
    Given url "https://tek-insurance-api.azurewebsites.net"
    And path "/api/token"
    And request {"username" :  "Supervisor", "password"  :  "wrong password"}
    When method post
    Then status 400
    And print response
    And assert response.errorMessage == "Password Not Matched"