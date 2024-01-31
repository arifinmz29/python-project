*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${Login-Url}    https://www.saucedemo.com/
${Browser}      chrome
${productName}  Sauce Labs Backpack


*** Keywords ***
Open Browser To Login page
    Open Browser    ${Login-Url}  ${Browser}
    Title Should Be    Swag Labs

Type In Username
    [Arguments]     ${username}
    Input Text    //*[@id="user-name"]    ${username}

Type In Password
    [Arguments]     ${password}
    Input Password    //*[@id="password"]    ${password}

Submit Credentials
    Click Button    //*[@id="login-button"]

Open Product Detail Page and Verify
    [Arguments]     ${productName}
    Click Element    //*[@id="item_4_title_link"]/div
    Wait Until Element Is Visible    //*[@id="inventory_item_container"]/div/div/div[2]/div[1]
    Element Text Should Be    //*[@id="inventory_item_container"]/div/div/div[2]/div[1]    ${productName}

Verify Existing Button
    ${present}=     Run Keyword And Return Status    Element Should Be Visible    //*[@id="remove-sauce-labs-backpack"]
    Log To Console    ${present}
    Run Keyword If    ${present}    Remove Product from Cart

Add Product to Cart
    [Arguments]     ${productName}
    Click Button    //*[@id="add-to-cart-sauce-labs-backpack"]
    Wait Until Element Is Visible    //*[@id="inventory_item_container"]/div/div/div[2]/div[1]
    Element Text Should Be    //*[@id="inventory_item_container"]/div/div/div[2]/div[1]    ${productName}

Remove Product from Cart
    Click Button    //*[@id="remove-sauce-labs-backpack"]
    Wait Until Element Is Visible    //*[@id="add-to-cart-sauce-labs-backpack"]

Open Cart and Verify
    Click Element    //*[@id="shopping_cart_container"]
    Wait Until Element Is Visible    //*[@id="header_container"]/div[2]/span
    Element Text Should Be    //*[@id="header_container"]/div[2]/span    Your Cart

Go to Checkout and Verify
    Click Button    //*[@id="checkout"]
    Wait Until Element Is Visible    //*[@id="header_container"]/div[2]
    Element Text Should Be    //*[@id="header_container"]/div[2]    Checkout: Your Information

Type In Buyer Info
    Input Text    //*[@id="first-name"]    Anton
    Input Text    //*[@id="last-name"]    Purba
    Input Text    //*[@id="postal-code"]    12001

Continue Checkout and Verify
    [Arguments]     ${productName}
    Click Button    //*[@id="continue"]
    Element Text Should Be    //*[@id="header_container"]/div[2]/span    Checkout: Overview
    Element Text Should Be    //*[@id="item_4_title_link"]/div    ${productName}

Finish Order and Verify
    Click Button    //*[@id="finish"]
    Wait Until Element Is Visible    //*[@id="header_container"]/div[2]/span
    Element Text Should Be    //*[@id="header_container"]/div[2]/span    Checkout: Complete!
    Element Text Should Be    //*[@id="checkout_complete_container"]/h2    Thank you for your order!
    Element Should Be Visible    //*[@id="back-to-products"]




