*** Settings ***
Library  SeleniumLibrary
Resource    common.robot

*** Variable ***
${email_field}      //*[@id="txtEmail"]
${pw_field}     //*[@id="txtPass"]
${login_oauth_btn}      //*[@id="lost-password-container"]/button
${loading_container}    //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/div
${create_btn}   //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[2]/div[2]/div/div/div/button
${read_checkbox}    //*[text()="Read"]
${trade_checkbox}   //*[text()="Trade"]
${payments_checkbox}     //*[text()="Payments"]
${admin_checkbox}        //*[text()="Admin"]
${trading_info_checkbox}      //*[text()="Trading information"]
${token_name}       //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[2]/div[2]/div/div/div/div/input
${delete_btn}    //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[3]/div[2]/div/div/table/tbody/tr/td[5]/button
${no_btn}    //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[3]/div[2]/div/div/table/tbody/tr/td[5]/div/button[1]
${yes_btn}      //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[3]/div[2]/div/div/table/tbody/tr/td[5]/div/button[2]
${table_row}       //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[3]/div[2]/div/div/table/tbody/tr

*** Test Cases ***
Open Deriv
    Login   ${my_email}     ${my_pw}

Create Without Any Input
    NoInput

Test Token Name Length
    TokenName=0
    TokenName=1
    TokenName=2
    TokenName=5
    TokenName=32
    TokenName=35

Numbers and Special Characters as Input
    TokenName=123456
    TokenName=!@$%^
    TokenName=TokenNumbers
    TokenName=TokenUnderScore
    TokenName=TokenUnderscoreNumbers

Create Token and Observe New Row
    TokenNewRow

Test Table Actions
    ClickDeleteButton
    Wait10s
    ClickNoButton
    ClickYesButton

Test Scope
    Checkbox=1
    Checkbox=2