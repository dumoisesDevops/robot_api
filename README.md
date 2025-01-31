# Robot API - Testes Automatizados com Robot Framework

## 👐 Passo 1: Criar um ambiente virtual (opcional, mas recomendado)

### Criando e ativando o ambiente virtual:

```sh
# Criar ambiente virtual
python -m venv venv

# Ativar no Linux/macOS
source venv/bin/activate  

# Ativar no Windows
venv\Scripts\activate  
```

---

## 👐 Passo 2: Instalar o Robot Framework e Bibliotecas Necessárias

### Instalando o Robot Framework:
```sh
pip install robotframework
```

### Instalando a biblioteca para testes de API (RequestsLibrary):
```sh
pip install robotframework-requests
```

### Instalando biblioteca para manipulação de JSON (opcional):
```sh
pip install robotframework-jsonlibrary
```

---

## 👐 Passo 3: Criar a Estrutura do Projeto

A estrutura do projeto deve seguir este formato:

```
tests/
|── api_tests.robot  # Arquivo com os testes de API
|── variables.yaml  # Variáveis reutilizáveis (se necessário)
|── resources/
|   ├── api_keywords.robot  # Palavras-chave personalizadas
|── results/  # Resultados dos testes
|── requirements.txt  # Dependências
```

Para salvar todas as dependências instaladas:

```sh
pip freeze > requirements.txt
```

---

## 👐 Passo 4: Criar um Teste Simples de API

Crie o arquivo `api_tests.robot` e adicione o seguinte código:

```robot
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
```

---

## 👐 Passo 5: Executar os Testes

Para rodar os testes, execute:

```sh
robot -d results tests/api_tests.robot
```

> 🔹 O parâmetro `-d results` salva os logs e relatórios na pasta `results/`.

---

## 👐 Passo 6: Verificar os Resultados

Após a execução, os seguintes arquivos serão gerados na pasta `results/`:

- 📝 `log.html` → Log detalhado
- 📝 `report.html` → Relatório de execução
- 📝 `output.xml` → Saída dos testes

Para abrir o relatório:

```sh
# No macOS/Linux
open results/report.html  

# No Windows
start results\report.html  
```

---

💪🏻 **Agora seu ambiente está pronto para automação de testes de API com o Robot Framework!**

