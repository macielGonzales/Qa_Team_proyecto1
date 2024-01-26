Feature: Post

  Scenario: Caso1
    Given url 'http://jsonplaceholder.typicode.com'
    And path '/posts/100'
    When method get
    Then status 200

  Scenario: Caso1
    * def id = 100
    Given url 'http://jsonplaceholder.typicode.com'
    And path '/posts/'+ id
    When method get
    Then status 200
    * print response