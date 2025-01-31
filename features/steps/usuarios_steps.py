from behave import given, then
import requests

BASE_URL = "https://serverest.dev"

@given(u'Eu faço uma requisição GET para "{endpoint}"')
def step_impl(context, endpoint):
    context.response = requests.get(f"{BASE_URL}{endpoint}")

@then(u'O código de status da resposta deve ser {status_code}')
def step_impl(context, status_code):
    assert context.response.status_code == int(status_code), \
        f"Esperado {status_code}, mas obteve {context.response.status_code}"

@then(u'O campo "{field}" deve ser {value}')
def step_impl(context, field, value):
    response_json = context.response.json()
    assert str(response_json.get(field)) == value, \
        f"Esperado {value}, mas obteve {response_json.get(field)}"

@then(u'O campo "{field}" deve estar vazio')
def step_impl(context, field):
    response_json = context.response.json()
    assert not response_json.get(field), \
        f"Esperado campo {field} vazio, mas obteve {response_json.get(field)}"
