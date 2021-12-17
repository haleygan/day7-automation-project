*** Settings ***
Documentation    Suite description
Library     SeleniumLibrary

*** Keyword ***
Login
    [arguments]     ${email}    ${pw}
     Open Browser    https://app.deriv.com/account/api-token        chrome
     maximize browser window
#	 Set window     1280    1028
     wait until page contains element   ${email_field}      15
	 input text     ${email_field}      ${email}
	 input text     ${pw_field}      ${pw}
	 Click Element   ${login_oauth_btn}

NoInput
    # check if token can be generated without any value input
    wait until page does not contain element    ${loading_container}    60
    wait until page contains element    ${token_name}   20
    wait until page contains element    ${create_btn}   20
    click element   ${create_btn}
    element should be disabled      ${create_btn}

TokenName=0
    click element   ${read_checkbox}
    element should be disabled      ${create_btn}

TokenName=1
    input text   ${token_name}       T
    element should be disabled      ${create_btn}

TokenName=2
    press keys  ${token_name}   CTRL+A+BACKSPACE
    input text   ${token_name}       To
    element should be enabled      ${create_btn}

TokenName=5
    press keys  ${token_name}   CTRL+A+BACKSPACE
    input text   ${token_name}       Token
    wait until element is enabled       ${create_btn}   15
    element should be enabled      ${create_btn}

TokenName=32
    press keys  ${token_name}   CTRL+A+BACKSPACE
    input text   ${token_name}       TokenTokenTokenTokenTokenTokenTo
    wait until element is enabled       ${create_btn}   15
    element should be enabled      ${create_btn}

TokenName=35
    press keys  ${token_name}   CTRL+A+BACKSPACE
    input text   ${token_name}       TokenTokenTokenTokenTokenTokenToken
    element should be disabled      ${create_btn}

TokenName=123456
    press keys  ${token_name}   CTRL+A+BACKSPACE
    input text   ${token_name}       123456
    element should be enabled      ${create_btn}

TokenName=!@$%^
    press keys  ${token_name}   CTRL+A+BACKSPACE
    input text   ${token_name}       !@$%^
    element should be disabled      ${create_btn}

TokenName=TokenNumbers
    press keys  ${token_name}   CTRL+A+BACKSPACE
    input text   ${token_name}       Token123
    wait until element is enabled       ${create_btn}   15
    element should be enabled      ${create_btn}

TokenName=TokenUnderScore
    press keys  ${token_name}   CTRL+A+BACKSPACE
    input text   ${token_name}       Token_
    wait until element is enabled       ${create_btn}   15
    element should be enabled      ${create_btn}

TokenName=TokenUnderscoreNumbers
    press keys  ${token_name}   CTRL+A+BACKSPACE
    input text   ${token_name}       Token_123
    wait until element is enabled       ${create_btn}   15
    element should be enabled      ${create_btn}

TokenNewRow
    press keys  ${token_name}   CTRL+A+BACKSPACE
    input text   ${token_name}       TestToken
    wait until element is enabled       ${create_btn}   15
    element should be enabled      ${create_btn}
    click element      ${create_btn}
    wait until page contains element      ${table_row}    15

ClickDeleteButton
    click element   ${delete_btn}
    wait until page contains element    ${no_btn}       15
    wait until element is visible   ${no_btn}       15
    element should be enabled   ${no_btn}
    wait until page contains element    ${yes_btn}      15
    wait until element is visible   ${yes_btn}      15
    wait until element is enabled       ${yes_btn}   15
    element should be enabled   ${yes_btn}

Wait10s
    wait until element is not visible       ${no_btn}       15
    wait until element is not visible       ${yes_btn}      15
    wait until element is visible       ${delete_btn}       15

ClickNoButton
    click element   ${delete_btn}
    wait until page contains element    ${no_btn}       15
    wait until element is visible   ${no_btn}       15
    element should be enabled   ${no_btn}
    click element       ${no_btn}
    wait until element is not visible       ${no_btn}       15
    wait until element is not visible       ${yes_btn}      15
    wait until element is visible       ${delete_btn}       15
    wait until element is enabled       ${delete_btn}   15
    element should be enabled       ${delete_btn}

ClickYesButton
    # delete TestToken1
    click element   ${delete_btn}
    wait until page contains element    ${yes_btn}      15
    wait until element is visible   ${yes_btn}      15
    element should be enabled   ${yes_btn}
    click element       ${yes_btn}
#    wait until page does not contain element        ${table_row}    15

Checkbox=1
    &{check_box_dict} =     Create Dictionary   0=${read_checkbox}  1=${trade_checkbox}  2=${payments_checkbox}  3=${admin_checkbox}    4=${trading_info_checkbox}
    FOR     ${key}     IN    @{check_box_dict}
            wait until page contains element    ${check_box_dict}[${key}]
            wait until element is visible   ${check_box_dict}[${key}]
            click element   ${check_box_dict}[${key}]         #select
            input text   ${token_name}       Token
            wait until element is enabled       ${create_btn}   15
            element should be enabled      ${create_btn}
            click element   ${create_btn}
            sleep   1
    END

Checkbox=2
    &{check_box_dict} =     Create Dictionary   0=${read_checkbox}  1=${trade_checkbox}  2=${payments_checkbox}  3=${admin_checkbox}    4=${trading_info_checkbox}
    FOR     ${key1}     IN      @{check_box_dict}
        FOR     ${key2}     IN     @{check_box_dict}
                wait until page contains element    ${check_box_dict}[${key1}]
                wait until element is visible   ${check_box_dict}[${key1}]
                wait until page contains element    ${check_box_dict}[${key2}]
                wait until element is visible   ${check_box_dict}[${key2}]
                continue for loop if      ${key1} < ${key2}
                continue for loop if      ${key1} == ${key2}
                sleep   1
                click element   ${check_box_dict}[${key1}]         #select
                click element   ${check_box_dict}[${key2}]         #select
                input text   ${token_name}       Token
                wait until element is enabled       ${create_btn}   15
                element should be enabled      ${create_btn}
                click element   ${create_btn}
                sleep   1
        END

    END