Feature: Exit Inquiry

  Background:
    * url 'https://dev-earn.honestmining.org/v2'
    * def auth = call read('classpath:api/proearn/authGenerate/authGenerateV2.feature')
    * def header = read('classpath:api/proearn/exitEarn/header.json')
    * set header.x-signature = auth.response.data.token
    * headers header

  Scenario: Success Exit Inquiry
    Given path '/earn/user/exit/inquiry'
    And request body = {"coin_id" : 5, "amount" : 0.0001}
    When method POST
    Then status 200
    And print response