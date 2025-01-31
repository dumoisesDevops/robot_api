*** Settings ***
Library  RequestsLibrary

*** Variables ***
${BASE_URL}  https://serverest.dev

*** Test Cases ***
Teste de GET - Buscar usuarios
    [Documentation]  Verifica listagem de usuarios 
    Create Session  API  ${BASE_URL}
    ${response}  GET On Session  API  /usuarios
    Should Be Equal As Strings  ${response.status_code}  200

Teste de GET - Buscar usuarios por ID
    [Documentation]  Verifica listagem de usuarios de acordo com Id informado
    Create Session  API  ${BASE_URL}
    ${response}  GET On Session  API  /usuarios/y49yS8Oi8ysCQRFA
    Should Be Equal As Strings  ${response.status_code}  200
 
Teste de GET - Não deve exibir usuários inválidos
 [Documentation]  Verifica se a API informa que não há usuários quando o usuário não for localizado
    Create Session  API  ${BASE_URL}
    ${response}  GET On Session  API  /usuarios/1
    Should Be Equal As Strings  ${response.status_code}  200
    ${response_json}  ${response.json()}
    ${quantidade}  Get From Dictionary  ${response_json}  quantidade
    Should Be Equal As Numbers  ${quantidade}  0
    ${usuarios}  Get From Dictionary  ${response_json}  usuarios
    Should Be Empty  ${usuarios}