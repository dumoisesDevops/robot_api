# Robot API - Testes Automatizados com Robot Framework

## 👐 Passo 1: Criar um ambiente virtual (opcional, mas recomendado)

### Criando e ativando o ambiente virtual:

```sh
# Criar ambiente virtual
python -m venv venv

# Ativar no Linux/macOS
source venv/bin/activate  

# Ativar no W
venv\Scripts\activat
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
ROBOT_API/
│── .github/workflows/
│   ├── test.yml  # Configuração de CI/CD
│── api-tests/
│   ├── resources/
│   │   ├── api_keywords.robot  # Palavras-chave personalizadas
│   ├── results/  # Resultados dos testes
│   ├── tests/  # Arquivos de testes Robot
│   ├── variables.yaml  # Variáveis reutilizáveis
│── features/
│   ├── steps/
│   │   ├── usuarios_steps.py  # Steps de implementação em Python
│   ├── usuarios.feature  # Cenários de teste em BDD
│── results/
│   ├── log.html  # Log detalhado
│   ├── output.xml  # Saída dos testes
│   ├── report.html  # Relatório de execução
│── venv/  # Ambiente virtual
│── .gitignore  # Arquivos ignorados no Git
│── README.md  # Documentação do projeto
│── requirements.txt  # Dependências do projeto
│── variables.yaml  # Variáveis globais
```

Para salvar todas as dependências instaladas:

```sh
pip freeze > requirements.txt
```

---


## 👐 Passo 4: Executar os Testes

Para rodar os testes, execute:

```sh
robot -d results tests/api_tests.robot
```

> 🔹 O parâmetro `-d results` salva os logs e relatórios na pasta `results/`.

---

## 👐 Passo 5: Verificar os Resultados

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

