*** Settings ***
Library    SeleniumLibrary
#Library    BuiltIn

*** Variables ***
${BROWSER}      chrome
${URL}          http://automationpractice.com

*** Keywords ***
### Setup e Teardown

Abrir Browser
    Open BROWSER                    about:blank    ${BROWSER}

Fechar Browser
    Close BROWSER

Acessar a página home do site
    Go to                            ${URL}
    Title Should Be                  My Store

Digitar o nome do produto "${PRODUTO}" no campo de pesquisa
    Input Text                       name=search_query    ${PRODUTO}

Clicar no botão pesquisar
    Click Element                    name=submit_search

Conferir se o produto "${PRODUTO}" foi listado corretamente
    Wait Until Element Is Visible    css:#center_column > h1
    Title Should Be                  Search - My Store
    Page Should Contain Image        xpath=//*[@id="center_column"]//*[@src="http://automationpractice.com/img/p/7/7-home_default.jpg"]
    Page Should Contain Link         xpath=//*[@id="center_column"]//*[@class="product-name"][contains(text(),"${PRODUTO}")]

Conferir mensagem de erro "${MENSAGEM_ERRO}" foi exibida corretamente
    Wait Until Element Is Visible    xpath=//div[@id="center_column"]/p[@class="alert alert-warning"]
    Element Text Should Be           xpath=//div[@id="center_column"]/p[@class="alert alert-warning"]    ${MENSAGEM_ERRO}
    #Element Text Should Be           xpath=//*[@id="center_column"]/h1/span[@class="heading-counter"]    ${MENSAGEM_ERRO}

Clicar na categoria "${CATEGORIA}" em categorias
    Mouse Over                       xpath=//*[@id="block_top_menu"]//a[@title="${CATEGORIA}"]
    Click Link                       xpath=//*[@id="block_top_menu"]/ul/li[1]/a

Clicar na sub categoria "${SUBCATEGORIA}"
    Click Link                       xpath=//*[@id="categories_block_left"]/div/ul/li[2]/a
    Click Link                       xpath=//*[@id="categories_block_left"]/div/ul/li[3]/a
    Element Text Should Be           xpath=//*[@id="center_column"]//span[@class="cat-name"]              ${SUBCATEGORIA}    


Clicar no botão "Add to cart" do produto
    Click Element                       xpath=//*[@id="center_column"]//a[@class="button ajax_add_to_cart_button btn btn-default"]

Clicar no botão "Proceed to checkout"
    Wait Until Element Is Visible    xpath=//*[@id="layer_cart"]//a[@class="btn btn-default button button-medium"]
    Click Element                       xpath=//*[@id="layer_cart"]//a[@class="btn btn-default button button-medium"]

Conferir item no resumo do carrinho "${ITEM_RESUMO}"
    Element Text Should Be           xpath=//*[@id="summary_products_quantity"]    ${ITEM_RESUMO}

Conferir imagem do produto no carrinho
    Page Should Contain Image        xpath=//*[@id="product_1_1_0_0"]//img[@src="http://automationpractice.com/img/p/1/1-small_default.jpg"]

Clicar no ícone carrinho de compras
    Click Element                       xpath=//*[@id="header"]/div[3]/div/div/div[3]/div/a

#Clicar no botão de remoção de produtos no carrinho
#    Click Link                       xpath=//*[@id="1_1_0_0"]

Conferir se mensagem "${MENSAGEM_CART_EMPTY}" foi exibida
    Element Text Should Be            xpath=//*[@id="center_column"]/p             ${MENSAGEM_CART_EMPTY}


Clicar no botão "Sign in"
    Click Element                     xpath=//*[@id="header"]/div[2]/div/div/nav/div[1]/a

Inserir um e-mail "${EMAIL_VALIDO}" válido
    Input Text                        xpath=//*[@id="email_create"]                ${EMAIL_VALIDO}

Clicar no botão "Create an account"
    Click Element                     xpath=//*[@id="SubmitCreate"]/span

Preencher os campos obrigatórios
    Wait Until Element Is Visible     xpath=//*[@id="id_gender1"]
    Select Radio Button               id_gender        1
    Input Text                        xpath=//*[@id="customer_firstname"]          Juan
    Input Text                        xpath=//*[@id="customer_lastname"]           Torena
    Input Text                        xpath=//*[@id="passwd"]                      123456
    Click Element                     xpath=//*[@id="days"]//*[@value="7"]
    Click Element                     xpath=//*[@id="months"]//*[@value="10"]
    Click Element                     xpath=//*[@id="years"]//*[@value="1990"]
    Select CheckBox                   newsletter
    Input Text                        xpath=//*[@id="firstname"]                   Max
    Input Text                        xpath=//*[@id="lastname"]                    Steel
    Input Text                        xpath=//*[@id="company"]                     Empresa
    Input Text                        xpath=//*[@id="address1"]                    Endereço
    Input Text                        xpath=//*[@id="city"]                        Cidade
    Click Element                     xpath=//*[@id="id_state"]//*[@value="5"]
    Input Text                        xpath=//*[@id="postcode"]                    86820
    Click Element                     xpath=//*[@id="id_country"]//*[@value="21"]
    Input Text                        xpath=//*[@id="phone_mobile"]                9999999999
    Input Text                        xpath=//*[@id="alias"]                       Endereço2

Clicar em "Register" para finalizar o cadastro
    Click Element                     xpath=//*[@id="submitAccount"]/span
    Wait Until Element Is Visible     xpath=//*[@id="center_column"]/h1   
