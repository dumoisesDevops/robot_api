Feature: Buscar usuários

  Scenario: Verifica listagem de usuários
    Given Eu faço uma requisição GET para "/usuarios"
    Then O código de status da resposta deve ser 200
    
Scenario: Verifica listagem de usuários de acordo com o ID informado
    Given Eu faço uma requisição GET para "/usuarios?_id=y49yS8Oi8ysCQRFA"
    Then O código de status da resposta deve ser 200

Scenario: Verifica se a API informa que não há usuários quando o usuário não for localizado
    Given Eu faço uma requisição GET para "/usuarios?_id=1"
    Then O código de status da resposta deve ser 200
    And O campo "quantidade" deve ser 0
    And O campo "usuarios" deve estar vazio    