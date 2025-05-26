*** Settings ***
Library    SeleniumLibrary


*** Keywords ***
LoginForm 
    [Arguments]    ${username}     ${password}
    Wait Until Element Is Visible    id:username    2s
    Input Text    id:username    ${username}

    Wait Until Element Is Visible    id:password    2s
    Input Password    id:password    ${password}
    
    Wait Until Element Is Visible    id:btn_submit    2s
    Click Button    id:btn_submit

Verify Successful Message
    Sleep    2s
    Wait Until Element Is Visible      id:modalDynamicMessage
    Element Text Should Be    id:modalDynamicMessage     You have logged in successfully. Please close this modal to continue to the main page.
    Click Element   id:modalDynamicButton
Verify Error Message
    Sleep    2s
    Wait Until Element Is Visible      id:modalDynamicMessage
    Element Text Should Be    id:modalDynamicMessage    Oops! Invalid Credentials. You have 2 more attempt(s) before your account is locked. Please contact HRPPMS-RSP for further assistance in verifying your information.     