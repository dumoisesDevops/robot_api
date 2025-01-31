*** Settings ***
Library  RequestsLibrary
Library  OperatingSystem
Library  Collections

*** Variables ***
${BASE_URL}  https://serverest.dev

*** Test Cases ***
Teste de GET - Buscar usuários
    [Documentation]  Verifica listagem de usuários
    Create Session  API  ${BASE_URL}  verify=False
    ${response}  GET On Session  API  /usuarios
    Should Be Equal As Strings  ${response.status_code}  200

Teste de GET - Buscar usuário por ID
    [Documentation]  Verifica se a API retorna o usuário correto com o ID fornecido
    Create Session  API  ${BASE_URL}  verify=False
    ${params}  Create Dictionary  _id=0QVTEYO4sDUMVhVF
    ${response}  GET On Session  API  /usuarios  params=${params}
    Should Be Equal As Strings  ${response.status_code}  200
    ${response_json}  Set Variable  ${response.json()}
    ${usuarios}  Get From Dictionary  ${response_json}  usuarios
    Should Not Be Empty  ${usuarios}
    ${usuario}  Get From List  ${usuarios}  0
    Should Be Equal As Strings  ${usuario['nome']}  Tim Harris
    Should Be Equal As Strings  ${usuario['email']}  Alvah54@hotmail.com
    Should Be Equal As Strings  ${usuario['password']}  y54LMomeCY3_jBm
    Should Be Equal As Strings  ${usuario['administrador']}  true
    Should Be Equal As Strings  ${usuario['_id']}  0QVTEYO4sDUMVhVF

Teste de GET - Não deve exibir usuários inválidos
    [Documentation]  Verifica se a API informa que não há usuários quando o usuário não for localizado
    Create Session  API  ${BASE_URL}  verify=False
    ${params}  Create Dictionary  _id=1
    ${response}  GET On Session  API  /usuarios  params=${params}
    Should Be Equal As Strings  ${response.status_code}  200
    ${response_json}  Set Variable  ${response.json()}
    ${quantidade}  Get From Dictionary  ${response_json}  quantidade
    Should Be Equal As Numbers  ${quantidade}  0
    ${usuarios}  Get From Dictionary  ${response_json}  usuarios
    Should Be Empty  ${usuarios}
