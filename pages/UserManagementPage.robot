*** Settings ***
Library    SeleniumLibrary
Resource     ../resource/EPM-Resource.robot
Library    FakerLibrary
Library    BuiltIn


*** Keywords ***

Go to User Management Page
    Go To    https://172.31.32.64/registration/userManagement.php

Download Employees Without Item No.
    Click Button    id:downloadListWNINhref
    Wait Until Element Is Visible    id:modalDynamicConfirmButtonYes
    Click Button    id:modalDynamicConfirmButtonYes

Download Employees With Item No.
    Click Button    id:downloadAllListBtn
    Wait Until Element Is Visible    id:modalDynamicConfirmButtonYes
    Click Button    id:modalDynamicConfirmButtonYes

Check If Overview Tab Is Active
    Page Should Contain Element    xpath=//li[contains(@class, 'active')]/a[@href='#UserInfoOverView']

Check If Personal Information Tab Is Active
    Page Should Contain Element    xpath=//li[contains(@class, 'active')]/a[@href='#AdminUpdateUserInfo']

Check If Item Code Tab Is Active
    Page Should Contain Element    xpath=//li[contains(@class, 'active')]/a[@href='#AdminUpdateItemCode']
    
Add New User

    ${given_name} =  FakerLibrary.first_name
    ${last_name} =  FakerLibrary.last_name

    ${last_name_faker}=    Set Variable    ${last_name} - DUMMY LAST 

    Click Button   id:btnAdd    
    Wait Until Element Is Visible    id:txtAddFName    2s
    Input Text    id:txtAddFName    ${given_name}

    Wait Until Element Is Visible    id:txtAddLName    2s
    Input Text    id:txtAddLName    ${last_name_faker}
    
    Wait Until Element Is Visible    id:btnAddNewUser    2s
    Click Button    id:btnAddNewUser

    Wait Until Element Is Visible    id:modalDynamicConfirmButtonYes
    Click Button    id:modalDynamicConfirmButtonYes

    Wait Until Element Is Visible    id:modalDynamicMessage    10s
    Click Button    ID:modalDynamicButton

Update User in Overview Tab

    FOR    ${i}    IN RANGE    2
        Execute JavaScript    document.querySelectorAll('#userManage thead tr th')[13].click()
        Sleep    1s
    END

    Wait Until Element Is Visible    xpath=//table[@id='userManage']//tr[td[contains(translate(., 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'), 'DUMMY LAST')]]//button[contains(text(), 'Update')]    5s
    Click Element     xpath=//table[@id='userManage']//tr[td[contains(translate(., 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'), 'DUMMY LAST')]]//button[contains(text(), 'Update')] 

    Sleep    2s

Update User in Personal Information
    ${given_name} =  FakerLibrary.first_name
    ${last_name} =  FakerLibrary.last_name

    ${last_name_faker}=    Set Variable    ${last_name} - DUMMY LAST 

    FOR    ${i}    IN RANGE    2
        Execute JavaScript    document.querySelectorAll('#userManage thead tr th')[13].click()
        Sleep    1s
    END

    Wait Until Element Is Visible    xpath=//table[@id='userManage']//tr[td[contains(translate(., 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'), 'DUMMY LAST')]]//button[contains(text(), 'Update')]    5s
    Click Element     xpath=//table[@id='userManage']//tr[td[contains(translate(., 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'), 'DUMMY LAST')]]//button[contains(text(), 'Update')] 

    Wait Until Element Is Visible    xpath=//*[@id="TabUpdatePersonalInformation"]    5s
    Click Element     xpath=//*[@id="TabUpdatePersonalInformation"]

    Check If Personal Information Tab Is Active

    Wait Until Element Is Visible    id:txtFName    2s
    Input Text    id:txtFName    ${given_name}

    Wait Until Element Is Visible    id:txtLName    2s
    Input Text    id:txtLName    ${last_name_faker}
    
    Wait Until Element Is Visible    id:btnUpdatePersonalInfo    2s
    Click Button    id:btnUpdatePersonalInfo

    Wait Until Element Is Visible    id:modalDynamicConfirmButtonYes
    Click Button    id:modalDynamicConfirmButtonYes

    Wait Until Element Is Visible    id:modalDynamicMessage    10s
    Click Button    id:modalDynamicButton

Update User in Item Code
    
    ${date_from}=    Evaluate    (datetime.datetime.now() - datetime.timedelta(days=random.randint(15, 30))).strftime('%d-%m-%Y')    modules=random,datetime

    FOR    ${i}    IN RANGE    2
        Execute JavaScript    document.querySelectorAll('#userManage thead tr th')[13].click()
        Sleep    1s
    END

    Wait Until Element Is Visible    xpath=//table[@id='userManage']//tr[td[contains(translate(., 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'), 'DUMMY LAST')]]//button[contains(text(), 'Update')]    5s
    Click Element     xpath=//table[@id='userManage']//tr[td[contains(translate(., 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'), 'DUMMY LAST')]]//button[contains(text(), 'Update')] 

    Wait Until Element Is Visible    xpath=//*[@id="TabUpdateItemCode"]    5s
    Click Element     xpath=//*[@id="TabUpdateItemCode"]

    Select From List By Value    id:UpdateNewItemCode    2943
    Input Text    id:UpdateNewDatefilled    ${date_from}