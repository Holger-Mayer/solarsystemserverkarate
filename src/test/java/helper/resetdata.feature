Feature: resetData

Background:
    * url host
  
Scenario: Reset data via REST Api
    Given path '/test/reset'
    When method get
