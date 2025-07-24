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

    Input Text    xpath=//*[@id="userManage_filter"]/label/input    DUMMY LAST
    Sleep    1s


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
    
    ${date_from}=    Evaluate    (datetime.datetime.now() - datetime.timedelta(days=random.randint(15, 30))).strftime('%d-%m')    modules=random,datetime

    FOR    ${i}    IN RANGE    2
        Execute JavaScript    document.querySelectorAll('#userManage thead tr th')[13].click()
        Sleep    1s
    END

    Input Text    xpath=//*[@id="userManage_filter"]/label/input    DUMMY LAST
    Sleep    1s

    Wait Until Element Is Visible    xpath=//table[@id='userManage']//tr[td[contains(translate(., 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'), 'UNREGISTERED')]][1]//button[contains(text(), 'Update')]    5s
    Click Element                    xpath=//table[@id='userManage']//tr[td[contains(translate(., 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'), 'UNREGISTERED')]][1]//button[contains(text(), 'Update')]

    Wait Until Element Is Visible    xpath=//*[@id="TabUpdateItemCode"]    5s
    Click Element     xpath=//*[@id="TabUpdateItemCode"]
    
    Wait Until Element Is Visible    id:UpdateNewItemCode    2s
    Select From List By Value    id:UpdateNewItemCode    3258

    Input Text    id:UpdateNewDatefilled    ${date_from}

    Wait Until Element Is Visible    xpath=//button[@id='btnUpdateItemCode']    2s
    Click Button    xpath=//button[@id='btnUpdateItemCode']
    
    Sleep    5s
    Wait Until Element Is Visible    id:modalDynamicConfirmButtonYes    2s    
    Click Button    id:modalDynamicConfirmButtonYes

    Wait Until Element Is Visible    id:modalDynamicMessage    10s
    Click Button    id:modalDynamicButton
    Sleep    2s


Update User in Item Code Job Vacated
    ${date_from}=    Evaluate    (datetime.datetime.now() ).strftime('%d-%m-%Y')    modules=random,datetime

    Input Text    xpath=//*[@id="userManage_filter"]/label/input    DUMMY LAST
    Sleep    1s

    Wait Until Element Is Visible    xpath=//table[@id='userManage']//tr[td[contains(translate(., 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'), 'RADIO PRODUCER')]]//button[contains(text(), 'Update')]    5s
    Click Element     xpath=//table[@id='userManage']//tr[td[contains(translate(., 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'), 'RADIO PRODUCER')]]//button[contains(text(), 'Update')]
    
    Wait Until Element Is Visible    xpath=//*[@id="TabUpdateItemCode"]    5s
    Click Element     xpath=//*[@id="TabUpdateItemCode"]
    

    Input Text    id:UpdateDateUnfilled    ${date_from}

    Wait Until Element Is Visible    id:UpdateReasonVacancy    2s
    Select From List By Value    id:UpdateReasonVacancy    5

    Click Button    id:btnUpdateItemCode

    Wait Until Element Is Visible    id:modalDynamicConfirmButtonYes    2s
    Click Button    id:modalDynamicConfirmButtonYes

    Wait Until Element Is Visible    id:modalDynamicMessage    10s
    Click Button    id:modalDynamicButton

Lock Specific User Account
    
    Input Text    xpath=//*[@id="userManage_filter"]/label/input    03-8277
    Sleep    1s
    
    Wait Until Element Is Visible    xpath=//table[@id='userManage']//tr[td[contains(translate(., 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'), '03-8277')]]//button[contains(text(), 'Lock Account')]    5s
    Click Element     xpath=//table[@id='userManage']//tr[td[contains(translate(., 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'), '03-8277')]]//button[contains(text(), 'Lock Account')]

    Wait Until Element Is Visible    id:modalDynamicConfirmButtonYes    2s
    Click Button    id:modalDynamicConfirmButtonYes

    Wait Until Element Is Visible    id:modalDynamicMessage    10s
    Click Button    id:modalDynamicButton

Unlock Specific User Account

    Input Text    xpath=//*[@id="userManage_filter"]/label/input    03-8277
    Sleep    1s
    
    Wait Until Element Is Visible    xpath=//table[@id='userManage']//tr[td[contains(translate(., 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'), '03-8277')]]//button[contains(text(), 'Unlock Account')]    5s
    Click Element     xpath=//table[@id='userManage']//tr[td[contains(translate(., 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'), '03-8277')]]//button[contains(text(), 'Unlock Account')]

    Wait Until Element Is Visible    id:modalDynamicConfirmButtonYes    2s
    Click Button    id:modalDynamicConfirmButtonYes

    Wait Until Element Is Visible    id:modalDynamicMessage    10s
    Click Button    id:modalDynamicButton

Reset Password Specific User Account

    Input Text    xpath=//*[@id="userManage_filter"]/label/input    03-8277
    Sleep    1s
    
    Wait Until Element Is Visible    xpath=//table[@id='userManage']//tr[td[contains(translate(., 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'), '03-8277')]]//button[contains(text(), 'Reset')]    5s
    Click Element     xpath=//table[@id='userManage']//tr[td[contains(translate(., 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'), '03-8277')]]//button[contains(text(), 'Reset')]

    Wait Until Element Is Visible    id:modalDynamicConfirmButtonYes    2s
    Click Button    id:modalDynamicConfirmButtonYes

    Wait Until Element Is Visible    id:modalDynamicMessage    10s
    Click Button    id:modalDynamicButton

Set The User Account To Inactive

    Input Text    xpath=//*[@id="userManage_filter"]/label/input    RADIO PRODUCER - DUMMY TEST INITIAL III
    Sleep    1s
    
    Wait Until Element Is Visible    xpath=//table[@id='userManage']//tr[td[contains(translate(., 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'), 'DUMMY LAST')]]//button[contains(text(), 'Inactive')]    5s
    Click Element     xpath=//table[@id='userManage']//tr[td[contains(translate(., 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'), 'DUMMY LAST')]]//button[contains(text(), 'Inactive')]

    Wait Until Element Is Visible    id:modalDynamicConfirmButtonYes    2s
    Click Button    id:modalDynamicConfirmButtonYes

    Wait Until Element Is Visible    id:modalDynamicMessage    10s
    Click Button    id:modalDynamicButton

Re-engage User Account

    Input Text    xpath=//*[@id="userManage_filter"]/label/input    DUMMY LAST
    Sleep    1s

    FOR    ${i}    IN RANGE    2
        Execute JavaScript    document.querySelectorAll('#userManage thead tr th')[8].click()
        Sleep    1s
    END
    
    Wait Until Element Is Visible    xpath=//table[@id='userManage']//tr[td[contains(translate(., 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'), 'RADIO PRODUCER - DUMMY TEST INITIAL III')]]//button[contains(text(), 'Re-Engage')]    5s
    Click Element     xpath=//table[@id='userManage']//tr[td[contains(translate(., 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'), 'RADIO PRODUCER - DUMMY TEST INITIAL III')]]//button[contains(text(), 'Re-Engage')]

    Wait Until Element Is Visible    id:modalDynamicConfirmButtonYes    2s
    Click Button    id:modalDynamicConfirmButtonYes

    Wait Until Element Is Visible    id:modalDynamicMessage    10s
    Click Button    id:modalDynamicButton