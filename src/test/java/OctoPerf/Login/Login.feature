Feature: Login Joy

  Background:
    * def usuarioOctoPerf = read('classpath:OctoPerf/Data/usuarioOctoPerf.json')
    Given url urlBaseOctoPerf
    And configure ssl = true
    And configure followRedirects = true
    And configure cookies = true

  Scenario Outline: Login de un Usuarios de OctoPerf Correcto
    Given path '/public/users/login'
    And   param password = '<password>'
    And   param username = '<usuario>'
    And   header Content-Type = 'application/json'
    And   header accept = '*/*'
    And   request ""
    When  method post
    Then  status <statusCode>
    * print response
    And  match response.token == '<token>'

    Examples:
      | karate.jsonPath(usuarioOctoPerf, "$[?(@.escenario =='01')]") |


  Scenario Outline: Login de un Usuarios de OctoPerf Correcto
    Given path '/public/users/login'
    And   param password = '<password>'
    And   param username = '<usuario>'
    And   header Content-Type = 'application/json'
    And   header accept = '*/*'
    And   request ""
    When  method post
    Then  status <statusCode>
    * print response
    And  match response.message == '<message>'
    And  match response.type == '<type>'

    Examples:
      | karate.jsonPath(usuarioOctoPerf, "$[?(@.escenario =='02')]") |

