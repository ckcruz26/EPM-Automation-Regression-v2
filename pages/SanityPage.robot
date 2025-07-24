*** Settings ***
Library    SeleniumLibrary
Library   DateTime
Resource     ../resource/EPM-Resource.robot


*** Keywords ***
Go To Profile Page
    Go To   https://172.31.32.64/registration/profile.php

Go to User Management Page
    Go To    https://172.31.32.64/registration/userManagement.php

#Profile Page

Upload Profile Picture
    [Arguments]  ${filePath}
    Click Button    id:openUploadProfile
    Choose File    id:profileImageInput    ${filePath}
    Click Button    xpath=//*[@id="frmUploadPicture"]/div[3]/button[2]
    Sleep    2s

 User Management Page Update Date Filled
    ${date_filled}     Evaluate    (datetime.datetime.now() - datetime.timedelta(days=random.randint(15, 30))).strftime('%d-%m-%Y')    modules=random,datetime

    Input Text    xpath=//input[@type='search']   03-12456
    Sleep    2s
    Click Button    id:btnAdminUpdate

    Sleep    2s
    Wait Until Element Is Visible    id:TabUpdateInformation    5s
    Click Element    id:TabUpdateInformation

    Input Text    id:UpdateInformationDateFilledUp    ${date_filled}
    Click Button    id:btnUpdateInfo

    Wait Until Element Is Visible    id:modalDynamicConfirmButtonYes    10s
    Click Button    id:modalDynamicConfirmButtonYes

    Wait Until Element Is Visible    id:modalDynamicMessage    10s
    Click Button    id:modalDynamicButton

    Sleep    2s


 User Management Page Update Date and Increment Step
    ${date_filled}     Evaluate    (datetime.datetime.now() - datetime.timedelta(days=random.randint(15, 30))).strftime('%d-%m-%Y')    modules=random,datetime

    Input Text    xpath=//input[@type='search']   03-0115
    Sleep    2s
    Click Button    id:btnAdminUpdate

    Sleep    2s

    Wait Until Element Is Visible    id:TabUpdateInformation    5s
    Click Element    id:TabUpdateInformation

    Select From List By Value    id:UpdateInformationIncrement    3
    Sleep    2s

    Input Text    id:UpdateInformationDateFilledUp    ${date_filled}
    Click Button    id:btnUpdateInfo

    Wait Until Element Is Visible    id:modalDynamicConfirmButtonYes    10s
    Click Button    id:modalDynamicConfirmButtonYes

    Wait Until Element Is Visible    id:modalDynamicMessage    10s
    Click Button    id:modalDynamicButton


# [START] * E-PDS SANITY TEST CASE 

# [END]*