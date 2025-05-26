*** Settings ***
Library    SeleniumLibrary
Resource     ../resource/EPM-Resource.robot
Library    FakerLibrary
Library    BuiltIn


*** Keywords ***
Open Access Control Page
    Go To    https://172.31.32.64/registration/accessControl.php

Set Bulk Access Control
    ${xpath_set}=     Set Variable    //*[@id="tblAccessControl"]//tr[td[contains(text(), 'DUMMY LAST')]]//button[contains(text(), 'Set')]    
    Input Text    xpath=//*[@id="tblAccessControl_filter"]/label/input    DUMMY LAST
    
    Wait Until Page Contains Element    xpath=${xpath_set}    timeout=2s
    Click Element        xpath=${xpath_set}
    
    Wait Until Element Is Visible    id=selectAllAccess    timeout=2s
    Click Element        id=selectAllAccess

    Wait Until Element Is Visible    id=saveUserAccess    timeout=2s
    Click Button    id:saveUserAccess

    Wait Until Element Is Visible    id:modalDynamicConfirmButtonYes
    Click Button    id:modalDynamicConfirmButtonYes

    Wait Until Element Is Visible    id:modalDynamicMessage    10s
    Click Button    id:modalDynamicButton
    
Remove Access Control
    ${xpath_remove}=     Set Variable    //*[@id="tblAccessControl"]//tr[td[contains(text(), 'DUMMY LAST')]]//button[contains(text(), 'Remove')]    
    
    FOR    ${i}    IN RANGE    3
        Execute JavaScript    document.querySelectorAll('#tblAccessControl thead tr th')[9].click()
        Sleep    1s
    END
    
    Wait Until Page Contains Element    xpath=${xpath_remove}    timeout=2s
    Click Element        xpath=${xpath_remove}

    Wait Until Element Is Visible    id:modalDynamicConfirmButtonYes
    Click Button        id:modalDynamicConfirmButtonYes

    Wait Until Element Is Visible    id:modalDynamicMessage    10s
    Click Button        id:modalDynamicButton

Filtering Users in EPM
    
     FOR    ${i}    IN    @{arrFilterVals}
        Select From List By Value    xpath=//*[@id="tblAccessControl_length"]/label/select    ${i}
        Sleep    2s
    END