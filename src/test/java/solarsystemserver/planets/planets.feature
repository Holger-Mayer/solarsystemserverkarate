Feature: sample planet rest server test script
 

Background:
  * url host

  * def shortResponse = 
 """
  {
    id:"#number",
    name:"#string"
  }
  """

  * def fullResponse = 
 """
  {
    id:"#number",
    name:"#string",
    diameter:"#number",
    mass:"#string",
    inclination:"#number",
    eccentricity:"#number",
    semiMajorAxis: "#number",
    surfaceGravity:"#number",
    orbitalPeriod:"#number",
    siderealRotation:"#number",
    satellites:"#number"
  }
  """
 
Scenario: SOL_T1 get all planets
  Given path '/planets'
  When method get
  Then status 200
  And match response =='#[9]'
  And match each response ==  shortResponse
  And match response[0] == {"id": 1,"name":"Mercury"}
  And match response[8] == {"id": 9,"name":"Pluto"}

  

Scenario: SOL_T29 get  earth
  Given path '/planets/3'
  When method get
  Then status 200
  And match response == fullResponse
  And match response == 
  """
  { 
    "id": 3,
    "name": "Earth",
    "diameter": 12756.3,
    "mass": " 5.974×10^24",
    "inclination": 5.0E-5,
    "eccentricity": 0.01671123,
    "semiMajorAxis": 1.00000261,
    "surfaceGravity": 9.78,
    "orbitalPeriod": 1.0,
    "siderealRotation": 0.997271,
    "satellites": 0
  }
  """

Scenario: SOL_T30 get  planet X
  Given path '/planets/10'
  When method get
  Then status 404
 

  