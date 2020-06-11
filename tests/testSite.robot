*** Settings ***
Resource         ../resource/resource.robot
Test Setup       Abrir Browser 
#Test Teardown    Fechar Browser

# Setup - Executa antes de cada teste #
# Teardown - Executa após cada teste  #

*** Test Cases ***
Caso de Teste 01: Pesquisar produto existente
    [Tags]    caso01
    Acessar a página home do site
    Digitar o nome do produto "Blouse" no campo de pesquisa
    Clicar no botão pesquisar
    Conferir se o produto "Blouse" foi listado corretamente

Caso de Teste 02: Pesquisar produto inexistente
    [Tags]    caso02
    Acessar a página home do site
    Digitar o nome do produto "ItemNãoExistente" no campo de pesquisa
    Clicar no botão pesquisar
    Conferir mensagem de erro "No results were found for your search \"ItemNãoExistente\"" foi exibida corretamente

Caso de Teste 03: Listar produtos
    [Tags]    caso03
    Acessar a página home do site
    Clicar na categoria "Women" em categorias
    Clicar na sub categoria "SUMMER DRESSES "

Caso de Teste 04: Adicionar produtos ao carrinho
    [Tags]    caso04
    Acessar a página home do site
    Digitar o nome do produto "T-Shirt" no campo de pesquisa
    Clicar no botão pesquisar
    Clicar no botão "Add to cart" do produto
    Clicar no botão "Proceed to checkout"
    Conferir item no resumo do carrinho "1 Product"
    Conferir imagem do produto no carrinho

Caso de Teste 05: Remover produtos
    [Tags]    caso05
    Acessar a página home do site
    Clicar no ícone carrinho de compras
    #Clicar no botão de remoção de produtos no carrinho
    Conferir se mensagem "Your shopping cart is empty." foi exibida

Caso de Teste 06: Adicionar Cliente
    [Tags]    caso06
    Acessar a página home do site
    Clicar no botão "Sign in"
    Inserir um e-mail válido
    Clicar no botão "Create an account"
    Preencher os campos obrigatórios
    Clicar em "Register" para finalizar o cadastro


