Feature: Planet UI Tests

Background:
    * url host
    * karate.call('classpath:/helper/resetdata.feature')

Scenario: SOL-T61 List all planets

    * configure driver = { type: 'chrome', showDriverLog: true }
 
    Given driver 'http://localhost:8080/home'
    When waitForUrl('http://localhost:8080/home')
    Then match html('.container') contains 'Earth'
    And match html('.container') contains 'Add planet'

Scenario: SOL-T62 add planet with valid minimal data
    * configure driver = { type: 'chrome', showDriverLog: true }
 
    Given driver 'http://localhost:8080/home'
    When waitForUrl('http://localhost:8080/home')
    And  click('{a}Add planet')
    And  waitForUrl('http://localhost:8080/addplanet')
    And  input('#id',"10")
    And  input('#name', 'Planet X')
    And  submit().click('#addplanet')
    And  waitForUrl('http://localhost:8080/addplanet')
    Then match html('.container') contains 'Planet X'

Scenario: SOL-T63 Add a planet without name
    * configure driver = { type: 'chrome', showDriverLog: true }
 
    Given driver 'http://localhost:8080/home'
    When waitForUrl('http://localhost:8080/home')
    And  click('{a}Add planet')
    And  waitForUrl('http://localhost:8080/addplanet')
    And  input('#id',"10")
    And  input('#name', ' ')
    And  submit().click('#addplanet')
    And  waitForUrl('http://localhost:8080/addplanet')
    Then match html('.container') contains 'Add new planet'

Scenario: SOL-T64 Add a planet without id
    * configure driver = { type: 'chrome', showDriverLog: true }
 
    Given driver 'http://localhost:8080/home'
    When waitForUrl('http://localhost:8080/home')
    And  click('{a}Add planet')
    And  waitForUrl('http://localhost:8080/addplanet')
    And  input('#id'," ")
    And  input('#name', 'Planet X ')
    And  submit().click('#addplanet')
    And  waitForUrl('http://localhost:8080/addplanet')
    Then match html('.container') contains 'Add new planet'


Scenario: SOL-T65 Add a planet with a full set of parameter
    * configure driver = { type: 'chrome', showDriverLog: true }
 
    Given driver 'http://localhost:8080/home'
    When waitForUrl('http://localhost:8080/home')
    And  click('{a}Add planet')
    And  waitForUrl('http://localhost:8080/addplanet')
    And  input('#id',"11")
    And  input('#name', 'Planet XI')
    And  input('#diameter', '1.0')
    And  input('#mass', '2.0')
    And  input('#inclination', '3.0')
    And  input('#eccentricity', '4.0')
    And  input('#semimajoraxis', '5.0')
    And  input('#surfacegravity', '6.0')
    And  input('#orbitalperiod', '7.0')
    And  input('#siderealrotation', '8.0')
    And  submit().click('#addplanet')
    And  waitForUrl('http://localhost:8080/addplanet')
     Then match html('.container') contains 'Planet XI'



    Scenario: SOL-T66 Add a planet with a full set of parameter but id is not a number
        * configure driver = { type: 'chrome', showDriverLog: true }
     
        Given driver 'http://localhost:8080/home'
        When waitForUrl('http://localhost:8080/home')
        And  click('{a}Add planet')
        And  waitForUrl('http://localhost:8080/addplanet')
        And  input('#id',"Alpha11")
        And  input('#name', 'Planet XI')
        And  input('#diameter', '1.0')
        And  input('#mass', '2.0')
        And  input('#inclination', '3.0')
        And  input('#eccentricity', '4.0')
        And  input('#semimajoraxis', '5.0')
        And  input('#surfacegravity', '6.0')
        And  input('#orbitalperiod', '7.0')
        And  input('#siderealrotation', '8.0')
        And  submit().click('#addplanet')
        And  waitForUrl('http://localhost:8080/addplanet')
         Then match html('.container') contains 'Planet XI'