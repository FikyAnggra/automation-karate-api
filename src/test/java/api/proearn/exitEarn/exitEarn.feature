Feature: Exit Earn

  Background:
    * url 'https://dev-earn.honestmining.org/v2'
    * def auth = call read('classpath:api/proearn/authGenerate/authGenerateV2.feature')
    * def header = read('classpath:api/proearn/exitEarn/header.json')
    * set header.x-signature = auth.response.data.token
    * headers header
    * def exitInquiry = call read('classpath:api/proearn/exitEarn/exitInquiry.feature')
    * def contract = exitInquiry.response.data.contract


  Scenario: Success Exit Earn
    Given path '/earn/user/exit'
    And request body = {"contract" : contract}
    When method POST
    Then status 200
    And print response