Feature: verify

#  Scenario number 7
  Background:

    Given url "https://tek-insurance-api.azurewebsites.net"
    * def result = callonce read('GenerateToken.feature')
    * def validToken = result.response.token
    And print validToken

  Scenario: get the account information from a specific account

    Then path "/api/accounts/get-account"
    And header Authorization = "Bearer "+validToken
    And param primaryPersonId = 11670
    When method get
    Then status 200

#    Scenario number 8

  Scenario: verify a non existing account
     Then path "/api/accounts/get/account"
     And header Authorization = "Bearer "+validToken
     And param primaryPersonId = 111234
     When method get
     Then status 404
