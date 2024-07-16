
Feature: performance test create search delete script

Background:
  * url host

* def randomID  = function(max){ return Math.floor(Math.random() * max) + 1000 }

* def planetID = randomID(1000)
* def  moonID = randomID(10000)


* def planet = 
"""
 {
   "id":#(parseInt(planetID)),
   "name":"Demo",
   "diameter":1.0,
   "mass":"2.0",
   "inclination":3.0,
   "eccentricity":4.0,
   "semiMajorAxis": 5.0,
   "surfaceGravity":6.0,
   "orbitalPeriod":7.0,
   "siderealRotation":8.0,
   "satellites":0
 }
 """

* def moon = 
    """
    {
      "id": #(moonID), 
      "name": "MoonName",
      "planetId": #(planetID),
      "mass": "0.0007112±0.0000010",
      "radius": "11.1±0.15",
      "density": "1.872±0.076",
      "magnitude": "11.4±0.2",
      "albedo": "0.071±0.012"
    }
     """

Scenario:  create search and  remove a randomly created planet with a single moon

     Given path '/planets'
     And request planet
     When method post
     Then status 201

    * karate.pause(2000)

     Given path '/moons'
     And request moon
     When method post
     Then status 201

    * karate.pause(2000)


     Given path '/planets/' + planetID
     When method get
     Then status 200


    Given path '/moons/' + moonID
     When method get
     Then status 200
     And match response == moon

    * karate.pause(5000)

     Given path '/planets/' + planetID
     When method delete
     Then status 200
     