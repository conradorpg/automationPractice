*** Settings ***
Resource         ../resource/resource.robot
Test Setup       Abrir Browser
Test Teardown    Fechar Browser

*** Variables ***
${URL}        http://automationpractice.com
${BROWSER}    chrome

*** Test Cases ***
Cenário 01: Pesquisar produto existente
    Dado que eu estou na página home do site
    Quando eu pesquisar pelo produto "Blouse"
    Então o produto "Blouse" deve ser listado na página de resultado de busca

Cenário 02: Pesquisar produto inexistente
    [Tags]    cenario02
    Dado que eu estou na página home do site
    Quando eu pesquisar pelo produto "ItemInexistente"
    Então a página deve exibir a mensagem "No results were found for your search \"ItemInexistente\""

*** Keywords ***

Dado que eu estou na página home do site
    Acessar a página home do site

Quando eu pesquisar pelo produto "${PRODUTO}"
    Digitar o nome do produto "${PRODUTO}" no campo de pesquisa
    Clicar no botão pesquisar

Então o produto "${PRODUTO}" deve ser listado na página de resultado de busca
    Conferir se o produto "${PRODUTO}" foi listado corretamente

Então a página deve exibir a mensagem "${MENSAGEM_ERRO}"
    Conferir mensagem de erro "${MENSAGEM_ERRO}" foi exibida corretamente