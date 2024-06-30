Feature: Moon UI Tests

Background:
    * url host
    * karate.call('classpath:/helper/resetdata.feature')

    * def testMoon  = 'Aphriodite'
    * def testMoon1 = 'Lunatic'
    * def testMoon2 = 'Aramis'
    * def testMoon3 = 'Portos'

Scenario: SOL-T67 add a moon to a planet without moons

    * configure driver = { type: 'chrome', showDriverLog: true }
 
    Given driver 'http://localhost:8080/home'
    When waitForUrl('http://localhost:8080/home')
    And  click('{a}Venus')
    And  waitForUrl('http://localhost:8080/planets/2')
    And  click('{a}Add moon')
    And  waitForUrl('http://localhost:8080/addmoon/2')
    And  input('#name', testMoon)
    And  submit().click('#addmoon')
    And  waitForUrl('http://localhost:8080/planets/2')
    Then match html('.container') contains testMoon

Scenario: SOL-T68 add a moon to a planet one moon

    * configure driver = { type: 'chrome', showDriverLog: true }
 
    Given driver 'http://localhost:8080/home'
    When waitForUrl('http://localhost:8080/home')
    And  click('{a}Earth')
    And  waitForUrl('http://localhost:8080/planets/3')
    And  click('{a}Add moon')
    And  waitForUrl('http://localhost:8080/addmoon/3')
    And  input('#name', testMoon1)
    And  submit().click('#addmoon')
    And  waitForUrl('http://localhost:8080/planets/3')
    Then match html('.container') contains testMoon1

Scenario: SOL-T69 add a moon to a planet two moons

    * configure driver = { type: 'chrome', showDriverLog: true }
 
    Given driver 'http://localhost:8080/home'
    When waitForUrl('http://localhost:8080/home')
    And  click('{a}Mars')
    And  waitForUrl('http://localhost:8080/planets/4')
    And  click('{a}Add moon')
    And  waitForUrl('http://localhost:8080/addmoon/4')
    And  input('#name', testMoon2)
    And  submit().click('#addmoon')
    And  waitForUrl('http://localhost:8080/planets/4')
    Then match html('.container') contains testMoon2


Scenario: SOL-T70 Add moon with full set of parameter

    * configure driver = { type: 'chrome', showDriverLog: true }
 
    Given driver 'http://localhost:8080/home'
    When waitForUrl('http://localhost:8080/home')
    And  click('{a}Mercury')
    And  waitForUrl('http://localhost:8080/planets/1')
    And  click('{a}Add moon')
    And  waitForUrl('http://localhost:8080/addmoon/1')
    And  input('#name', testMoon3)
    And  input('#radius ', "1")
    And  input('#mass', "2")
    And  input('#density', "3")
    And  input('#magnitude', "4")
    And  input('#albedo', "5")
    And  submit().click('#addmoon')
    And  waitForUrl('http://localhost:8080/planets/1')
    Then match html('.container') contains testMoon3

Scenario: SOL-T72 Add moon with full set of parameter but blank name

    * configure driver = { type: 'chrome', showDriverLog: true }
 
    Given driver 'http://localhost:8080/home'
    When waitForUrl('http://localhost:8080/home')
    And  click('{a}Mercury')
    And  waitForUrl('http://localhost:8080/planets/1')
    And  click('{a}Add moon')
    And  waitForUrl('http://localhost:8080/addmoon/1')
    And  input('#name', "  ")
    And  input('#radius ', "1")
    And  input('#mass', "2")
    And  input('#density', "3")
    And  input('#magnitude', "4")
    And  input('#albedo', "5")
    And  submit().click('#addmoon')
    And  waitForUrl('http://localhost:8080/addmoon')


Scenario: SOL-T73 Delete a moon from Planet Mars

    * configure driver = { type: 'chrome', showDriverLog: false }
 
    Given driver 'http://localhost:8080/home'
    When waitForUrl('http://localhost:8080/home')
    And  click('{a}Mars')
    And  waitForUrl('http://localhost:8080/planets/4')
    And  click('{a}Deimos')
    And  waitForUrl('http://localhost:8080/moons/2')
    And  click('{a}Delete')
    And  waitForUrl('http://localhost:8080/planets/4')
    Then match html('.container') contains "Mars"
    Then match html('.container') !contains "Deimos"
 