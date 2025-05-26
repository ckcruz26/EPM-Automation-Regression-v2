*** Settings ***
Library    SeleniumLibrary
Resource     ../resource/EPM-Resource.robot
Library    FakerLibrary
Library    BuiltIn


*** Keywords ***

Go To Position Page
    Go To    https://172.31.32.64/registration/position.php

Add New Item Position
    ${date_from}=    Evaluate    (datetime.datetime.now() - datetime.timedelta(days=random.randint(15, 30))).strftime('%d-%m-%Y')    modules=random,datetime

    Wait Until Element Is Visible    id:btnAdd    2s
    Click Button    id:btnAdd
    
    Wait Until Element Is Visible    id:addPositionClassification    2s
    Select From List by Value        id:addPositionClassification       3

    Wait Until Element Is Visible    id:addPositionName    2s
    Select From List By Value    id:addPositionName    142

    Wait Until Element Is Visible    id:addPositionSalaryGrade    2s
    Select From List By Value    id:addPositionSalaryGrade      6

    Wait Until Element Is Visible    id:addPositionFundSource    2s
    Select From List By Value    id:addPositionFundSource        3

    Wait Until Element Is Visible    id:addPositionDateCreated    2s
    Input Text    id:addPositionDateCreated        ${date_from}

    Wait Until Element Is Visible    id:addPositionDivision    2s
    Select From List By Value    id:addPositionDivision        2

    Wait Until Element Is Visible    id:addPositionUnit        2s
    Select From List By Value    id:addPositionUnit        17

    Wait Until Element Is Visible    id:addPositionAreaAssignment    2s
    Select From List By Value    id:addPositionAreaAssignment     16

    Wait Until Element Is Visible    xpath=//*[@id="positionContentAdd"]/div[3]/button[2]        2s
    Click Button    xpath=//*[@id="positionContentAdd"]/div[3]/button[2]

    Wait Until Element Is Visible    id:modalDynamicConfirmButtonYes    2s
    Click Button    id:modalDynamicConfirmButtonYes

    Wait Until Element Is Visible    id:modalDynamicMessage    10s
    Click Button    id:modalDynamicButton

Update the Position
    
    Input Text     xpath=//*[@id="userManage_filter"]/label/input        CONSERVATION OFFICER

    Wait Until Element Is Visible    xpath=//table[@id='userManage']//tr[td[contains(translate(., 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'), 'CONSERVATION OFFICER')]]//button[contains(text(), 'Update')]    5s
    Click Element     xpath=//table[@id='userManage']//tr[td[contains(translate(., 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'), 'CONSERVATION OFFICER')]]//button[contains(text(), 'Update')]

    Wait Until Element Is Visible    id:UpdatePositionUnit        2s
    Select From List By Value    id:UpdatePositionUnit            3

    Wait Until Element Is Visible    id:UpdatePositionAreaAssign       2s
    Select From List By Value    id:UpdatePositionAreaAssign        2
    
    Wait Until Element Is Visible    xpath=//*[@id="frmUpdatePosition"]/div/div[2]/button[2]        2s
    Click Button    xpath=//*[@id="frmUpdatePosition"]/div/div[2]/button[2]

    Wait Until Element Is Visible    id:modalDynamicConfirmButtonYes    2s
    Click Button    id:modalDynamicConfirmButtonYes

    Wait Until Element Is Visible    id:modalDynamicMessage    10s
    Click Button    id:modalDynamicButton

Abolish the Position    
    Input Text     xpath=//*[@id="userManage_filter"]/label/input        CONSERVATION OFFICER

    Wait Until Element Is Visible    xpath=//table[@id='userManage']//tr[td[contains(translate(., 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'), 'CONSERVATION OFFICER')]]//button[contains(text(), 'Update')]    5s
    Click Element     xpath=//table[@id='userManage']//tr[td[contains(translate(., 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'), 'CONSERVATION OFFICER')]]//button[contains(text(), 'Update')]

    Wait Until Element is Visible     id:btnDeletePosition        2s
    Click Button    id:btnDeletePosition

    Wait Until Element Is Visible    id:modalDynamicConfirmButtonYes    2s
    Click Button    id:modalDynamicConfirmButtonYes

    Wait Until Element Is Visible    id:modalDynamicMessage    10s
    Click Button    id:modalDynamicButton