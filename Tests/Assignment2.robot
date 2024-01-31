*** Settings ***
Library     SeleniumLibrary
Resource    ../Resources/Resources.robot

*** Variables ***
${username}     standard_user
${password}     secret_sauce
${productName}  Sauce Labs Backpack

*** Test Cases ***
Valid Login
    Open Browser To Login page
    Type In Username        ${username}
    Type In Password        ${password}
    Submit Credentials
    Sleep    2
    Title Should Be    Swag Labs

Add To Cart
    Open Product Detail Page and Verify    ${productName}
    Verify Existing Button
    Add Product to Cart    ${productName}
    Open Cart and Verify

Checkout Cart
    Go to Checkout and Verify
    Type In Buyer Info
    Continue Checkout and Verify    ${productName}

Finish Order
    Finish Order and Verify








