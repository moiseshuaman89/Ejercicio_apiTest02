@ignore
Feature: Pruebas de Apis post
  Background:
    * def registroPets = read('classpath:Mascotas/Data/datosPets.json')
    Given url urlPetStore

  Scenario Outline: Registra una nueva mascota
    Given path '/v2/pet'
    And header Content-Type = 'application/json'
    And header accept = 'application/json'
    And request { "id": <id>, "category": { "id": <id>,"name": "<name>"},"name": "doggie","photoUrls": ["<photoUrls>"],"tags": [{"id": <id>,"name": "<name>"}],"status": "<status>"}
    When method post
    Then status <statusCode>
    * print response
    And match response == { "id": <id>, "category": { "id": <id>,"name": "<name>"},"name": "doggie","photoUrls": ["<photoUrls>"],"tags": [{"id": <id>,"name": "<name>"}],"status": "<status>"}
    Examples:
      | karate.jsonPath(registroPets, "$[?(@.escenario =='01')]") |