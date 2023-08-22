#Scenario 1
@Regression
Feature: Generate Token
  Scenario: Validate user credentials
    Given url "https://tek-insurance-api.azurewebsites.net"
    And path  "/api/token"
    And request {"username" :  "Supervisor", "password" :  "tek_supervisor"}
    When method post
    Then status 200
    And print response