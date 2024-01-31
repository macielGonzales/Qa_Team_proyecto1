Feature: Ejercicios clase 4

  Scenario: Caso 1
    * def id = 100
    Given url 'https://jsonplaceholder.typicode.com'
    And path '/posts/'+ id
    When method get
    Then status 200
    And match responseType == 'json'
    And match $.id == id

  Scenario: Caso 2
    Given url 'https://reqres.in/'
    And path page=2
    When method get
    Then status 200
    And match responseType == 'json'
    * print response.data[2].id == 9
    And match response.data[2].firts_name == 'Tobias'

  Scenario: Caso 3 - crear usuario
    Given url 'https://reqres.in/'
    And path '/api/users'
    And request {"name":"Maciel", "job":CL-QA"}
    When method post
    Then status 201
    And match response.name == 'Maciel'
    And match response.job == 'CL-QA'

  Scenario: Caso 4 - crear usuario
    Given url 'https://reqres.in/'
    And path '/api/users'
    And request read("bodyUser.json")
    When method post
    Then status 201
    And match response.name == 'Maciel'
    And match response.job == 'CL-QA'

  Scenario: Caso 5 - Login
    Given url 'https://reqres.in'
    And path '/api/login'
    And form field email = 'eve.holt@reqres.in'
    And form field password = 'cityslicka'
    When method post
    Then status 200
    And match response.token == "#notnull"

  Scenario: Caso 6 - Login
    * def id = 2
    Given url 'https://reqres.in'
    And path '/api/users'+ id
    And request read("bodyUser.json")
    When method put
    Then status 200
    * print response
    And match response.name == ""

  Scenario: Caso 5 - Login unsucccessful
    Given url 'https://reqres.in'
    And path '/api/login'
    And form field email = 'peter@klaven'
    When method post
    Then status 400
    And match response.error == "Missing password"

  Scenario: Caso 6 - Delete
    * def id = 2
    Given url 'https://reqres.in'
    And path '/api/users/' + id
    When method delete
    Then status 204
