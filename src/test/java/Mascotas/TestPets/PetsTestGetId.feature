
Feature: Pruebas de Apis GET

  Scenario: Obtener una mascota Existente
    * def registerPets = call read('PetsTestRegistrePost.feature')
    * def id = registerPets.response.id
    * print id
    Given url urlPetStore + '/v2/pet/' + id
    And header accept = 'application/json'
    And header api_key = 'api_key'
    When method get
    Then status 200
    * print response
