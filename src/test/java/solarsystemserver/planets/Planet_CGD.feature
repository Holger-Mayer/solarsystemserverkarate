Feature: sample planet rest server test script
 

Background:
  * url host



Scenario: get and store Pluto, remove Pluto, verify Pluto gone, create Pluto

    Given path '/planets/9'
    When method get
    Then status 200
    
    * def pluto =  response

    Given path '/moons/planet/9'
    When method get
    Then status 200

    * def moons = response
 
    Given path '/planets/9'
    When method delete
    Then status 200

    Given path '/planets/9'
    When method get
    Then status 404

    Given path '/planets'
    And request pluto
    When method post
    Then status 201

    Given path '/moons'
    And request moons[0]
    When method post
    Then status 201

    Given path '/moons'
    And request moons[1]
    When method post
    Then status 201

    Given path '/planets/9'
    When method get
    Then status 200

   