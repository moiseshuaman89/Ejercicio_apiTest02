@ignore
Feature: Pruebas de Apis PUT
  Background:
    * def putPets = read('classpath:Mascotas/Data/datosPets.json')
    Given url urlPetStore

  Scenario Outline: Actualizar datos de una Mascota
    Given path '/v2/pet'
    And def requestPut =
    """
      {
      "id":<id>,
      "category": {
        "id": <id>,
        "name": "<name>"
        },
      "name": "doggie",
      "photoUrls": [
        "<photoUrls>"
      ],
      "tags": [
        {
          "id": <id>,
          "name": "<name>"
         }
       ],
      "status": "<status>"
    }
    """
    And header accept = 'application/json'
    And header Content-Type = 'application/json'
    And request requestPut
    When method put
    Then status 200
    * print response
    And match response == { "id": <id>, "category": { "id": <id>,"name": "<name>"},"name": "doggie","photoUrls": ["<photoUrls>"],"tags": [{"id": <id>,"name": "<name>"}],"status": "<status>"}
    Examples:
      | karate.jsonPath(putPets, "$[?(@.escenario =='02')]") |
