# robot_api
python -m venv venv
source venv/bin/activate  # Linux/macOS
venv\Scripts\activate  # Windows
Instalar o Robot Framework e as Bibliotecas Necessárias
📌 Passo 1: Criar um ambiente virtual (opcional, mas recomendado)
sh
Copiar
Editar
python -m venv venv
source venv/bin/activate  # Linux/macOS
venv\Scripts\activate  # Windows
📌 Passo 2: Instalar o Robot Framework
sh
Copiar
Editar
pip install robotframework
📌 Passo 3: Instalar a biblioteca para testes de API (RequestsLibrary)
sh
Copiar
Editar
pip install robotframework-requests
Se precisar trabalhar com JSON, também instale:

sh
Copiar
Editar
pip install robotframework-jsonlibrary
2️⃣ Criar a Estrutura do Projeto
plaintext
Copiar
Editar
tests/
│── api_tests.robot  # Arquivo com os testes de API
│── variables.yaml  # Variáveis reutilizáveis (se necessário)
│── resources/
│   ├── api_keywords.robot  # Palavras-chave personalizadas
│── results/  # Resultados dos testes
│── requirements.txt  # Dependências
Para salvar todas as dependências:

sh
Copiar
Editar
pip freeze > requirements.txt
3️⃣ Criar um Teste Simples de API
Crie o arquivo api_tests.robot e adicione:

robot
Copiar
Editar
*** Settings ***
Library  RequestsLibrary

*** Variables ***
${BASE_URL}  https://jsonplaceholder.typicode.com

*** Test Cases ***
Teste de GET - Buscar Posts
    [Documentation]  Valida a resposta da API de posts
    Create Session  API  ${BASE_URL}
    ${response}  GET On Session  API  /posts/1
    Should Be Equal As Strings  ${response.status_code}  200
    Log To Console  ${response.json()}
4️⃣ Executar os Testes
Rode o comando:

sh
Copiar
Editar
robot -d results tests/api_tests.robot
-d results → Salva os logs e relatórios na pasta results/.
5️⃣ Verificar os Resultados
Após a execução, os arquivos serão gerados na pasta results/:

📄 log.html → Log detalhado
📄 report.html → Relatório de execução
📄 output.xml → Saída dos testes
Para abrir o relatório, rode:

sh
Copiar
Editar
open results/report.html  # macOS/Linux
start results\report.html  # Windows
