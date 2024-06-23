Feature: sample moon server test script
 

  Background:
    * url host

   * def lunar = 
 """
    { 
      "id": 0,
      "name": "Moon", 
      "planetId": 3,
      "mass": "4902.801±0.001", 
      "radius": "1737.5±0.1",
      "density": "3.344±0.005",
      "magnitude": "-12.74",
      "albedo": "0.12"
    }
    """

* def phobos = 
    """
    {
      "id": 1, 
      "name": "Phobos",
      "planetId": 4,
      "mass": "0.0007112±0.0000010",
      "radius": "11.1±0.15",
      "density": "1.872±0.076",
      "magnitude": "11.4±0.2",
      "albedo": "0.071±0.012"
    }
     """

* def deimos =
      """
    {
      "id": 2,
      "name": "Deimos",
      "planetId": 4,
      "mass": "0.0000985±0.0000024",
      "radius": "6.2±0.18",
      "density": "1.471±0.166",
      "magnitude": "12.45±0.05",
      "albedo": "0.068±0.007"
    }
    """
  Scenario: SOL_T31 get all moons for venus 
    Given path '/moons/planet/2'
    When method get
    Then status 200
    And match response == []


  Scenario: SOL_T3 get all moons for earth 
    Given path '/moons/planet/3'
    When method get
    Then status 200
    And assert response.length == 1
    And match response[0] == lunar
   
   
  Scenario: SOL_T32 get all moons for mars 
    Given path '/moons/planet/4'
    When method get
    Then status 200
    And assert response.length == 2
    And match response[0] == phobos
    And match response[1] == deimos 
   
  Scenario: SOL_T4 get moon via id
    Given path '/moons/0'
    When method get
    Then status 200
    And match response == lunar
