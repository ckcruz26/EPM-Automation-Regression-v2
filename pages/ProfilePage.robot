*** Settings ***
Library    SeleniumLibrary
Resource     ../resource/EPM-Resource.robot
Library    FakerLibrary
Library    BuiltIn
Library    random
Library    DateTime



*** Keywords ***
Change Password Form
    Click Button    id:openChangePassword
    Input Password    id:OldPassword    ${personnelPW}
    # Input Password    id:NewPassword    ${forChangePassword}
    # Input Password    id:ConfirmPassword   ${forChangePassword} 
    Click Button    id:modalDynamicConfirmButtonYes

Go To Profile Page
    Go To   https://172.31.32.64/registration/profile.php
Verify Password Change Message 
    Wait Until Element Is Visible    id:modalDynamicConfirmLogoutMessage
    Element Text Should Be           id:modalDynamicConfirmLogoutMessage    Your password has been successfully updated. Would you like to stay logged in or log out and sign in again with your new password?
    Click Button    id:modalDynamicConfirmLogoutButtonYes

Bank Details Form
    Wait Until Element Is Visible    id:frmBankDetails    10s
    Wait Until Element Is Visible    id:addBankAccount    10s
    Input Text    id:addBankAccount    37771888123
    Wait Until Element Is Enabled    id:btnSaveAccountNumber    10s
    Click Button    id:btnSaveAccountNumber
    Wait Until Element Is Visible    id:modalDynamicConfirmButtonYes    10s
    Click Button    id:modalDynamicConfirmButtonYes
    Wait Until Element Is Visible    id:modalDynamicMessage    10s
Check If Overview Tab Is Active
    Page Should Contain Element    xpath=//li[contains(@class, 'active')]/a[@href='#overView']
Check If Basic Information Tab Is Active
    Page Should Contain Element    xpath=//li[contains(@class, 'active')]/a[@href='#basicInfo']
Check If Other Information Tab Is Active
    Page Should Contain Element    xpath=//li[contains(@class, 'active')]/a[@href='#otherInfo']
Check If Family Background Tab Is Active
    Page Should Contain Element    xpath=//li[contains(@class, 'active')]/a[@href='#familyBackground']
Check If Educational Background Tab Is Active
    Page Should Contain Element    xpath=//li[contains(@class, 'active')]/a[@href='#academic']
Check If Work Experience Tab is Active
    Page Should Contain Element    xpath=//li[contains(@class, 'active')]/a[@href='#career']
Check If Eligbility Tab Is Active
    Page Should Contain Element    xpath=//li[contains(@class, 'active')]/a[@href='#eligibility']
Check If Voluntary Work Is Active
    Page Should Contain Element    xpath=//li[contains(@class, 'active')]/a[@href='#voluntaryWork']
Check If Training Tab Is Active
    Page Should Contain Element    xpath=//li[contains(@class, 'active')]/a[@href='#training']
Check If Special Skills Tab Is Active
    Page Should Contain Element    xpath=//li[contains(@class, 'active')]/a[@href='#skills']
Check If Non Academic Distinction Tab Is Active
    Page Should Contain Element    xpath=//li[contains(@class, 'active')]/a[@href='#nonAcademic']
Check If Reference Tab Is Active
    Page Should Contain Element    xpath=//li[contains(@class, 'active')]/a[@href='#references']
Check If Government Issued ID Tab is Active
    Page Should Contain Element    xpath=//li[contains(@class, 'active')]/a[@href='#GovernID']
Check If Other Information (Part 2) Tab is Active
    Page Should Contain Element    xpath=//li[contains(@class, 'active')]/a[@href='#otherinfo2']
Fill Up Basic Information Form
    Wait Until Element Is Visible    id=AddRegion    10s
    Select From List By Value        id=AddRegion        030000000
    Wait Until Element Is Visible    id=AddProvince    10s
    Select From List By Value        id=AddProvince      031400000
    Wait Until Element Is Visible    id=AddCity    10s
    Select From List By Value        id=AddCity         031405000
    Wait Until Element Is Visible    id=AddZipCode    10s
    Input Text    id:AddZipCode    3017
    Wait Until Element Is Visible    id=AddMobileNo    10s
    Input Text    id:AddMobileNo    09285370995
    Wait Until Element Is Visible    id=AddEmail    10s
    Input Text    id:AddEmail    ckcruz@dswd.gov.ph
    Wait Until Element Is Enabled    id:btnUserBasicInfoUpdate    10s
    Click Button    id:btnUserBasicInfoUpdate
    Wait Until Element Is Visible    id:modalDynamicConfirmButtonYes    10s
    Click Button    id:modalDynamicConfirmButtonYes
    Wait Until Element Is Visible    id:modalDynamicMessage    10s


Fill Up Other Information Form
    ${height}=    Evaluate    random.randint(150, 210)    random
    ${height_in_m}=    Evaluate    round(${height} / 100, 2)
    ${weight}=    Evaluate    random.randint(50, 70)    random
        
    ${bloodTypeVal}=    Evaluate    random.randint(1, 19)    random
    ${pagIbigNoVal}=    Numerify    %%%%-%%%%-%%%%
    ${philHealthVal}=    Numerify    21-%%%%%%%%%-%
    ${tinID}=    Numerify    %%%-%%%-%%%-%%%


    Wait Until Element Is Visible    id=PlaceOfBirth   10s
    Input Text    id=PlaceOfBirth    Bulakan
    Wait Until Element Is Visible    id:CivilStatus   10s
    Select From List By Value    id=CivilStatus    1
    Wait Until Element Is Visible    id=Height   10s
    Input Text    id=Height    ${height_in_m}
    Wait Until Element Is Visible    id=Weight   10s
    Input Text    id=Weight    ${weight}
    Wait Until Element Is Visible    id=BloodType   10s
    Select From List By Value    id=BloodType    ${bloodTypeVal}

    Wait Until Element Is Visible    id=pagibigNo   10s
    Input Text    id=pagibigNo    ${pagIbigNoVal}

    Wait Until Element Is Visible    id=philhealthNo   10s
    Input Text    id=philhealthNo    ${philHealthVal}

    Wait Until Element Is Visible    id=tinNo   10s
    Input Text    id=tinNo    ${philHealthVal}

    Wait Until Element Is Visible    id=tinNo   10s
    Input Text    id=tinNo    ${tinID}

    Wait Until Element Is Visible    id:btnUserUpdateOtherBasicInfo   10s
    Click Button    id:btnUserUpdateOtherBasicInfo

    Wait Until Element Is Visible    id:modalDynamicConfirmButtonYes    10s
    Click Button    id:modalDynamicConfirmButtonYes
    Wait Until Element Is Visible    id:modalDynamicMessage    10s
    
Add Family Background Form

    ${given_name} =  FakerLibrary.first_name
    ${last_name} =  FakerLibrary.last_name
    ${relationValFaker}=    Evaluate    random.choice([2])    modules=random

    ${bday}=    Date Of Birth    minimum_age=20    maximum_age=30
    ${bday_formatted}=    Convert Date    ${bday}    %m/%d/%Y
    
    Wait Until Element Is Visible    id=relation   10s
    Select From List By Value    id=relation    ${relationValFaker}
    
    Wait Until Element Is Visible    id=FBSname   10s
    Input Text    id=FBSname    ${last_name}

    Wait Until Element Is Visible    id=FBFname   10s
    Input Text    id=FBFname    ${given_name}

    Wait Until Element Is Visible    id=FBDOB   10s
    Input Text    id=FBDOB    ${bday_formatted}
    
    Wait Until Element Is Visible    id:btnUserFamilyBackgroundAdd    10s
    Click Button    id:btnUserFamilyBackgroundAdd

    Wait Until Element Is Visible    id:modalDynamicConfirmButtonYes    10s
    Click Button    id:modalDynamicConfirmButtonYes

    Wait Until Element Is Visible    id:modalDynamicMessage    10s
    Click Button    ID:modalDynamicButton

# Update Family Background
    # ${xpath_update}=     Set Variable    //*[@id="tblFBMember"]//tr[td[contains(text(), 'Children')]]//button[contains(text(), 'Update')]    

    # ${given_name} =  FakerLibrary.first_name
    # ${last_name} =  FakerLibrary.last_name
 

    # ${bday}=    Date Of Birth    minimum_age=20    maximum_age=30
    # ${bday_formatted}=    Convert Date    ${bday}    %m/%d/%Y

    # Click Element    xpath=${xpath_update}

    # Sleep    2s

    # Wait Until Element Is Visible    id:updateFBSname   10s
    # Input Text    id=updateFBSname   ${last_name}

    # Wait Until Element Is Visible    id:updateFBFname   10s
    # Input Text    id=updateFBFname   ${given_name}

    # Wait Until Element Is Visible    id:updateFBDOB   10s
    # Input Text    id=updateFBDOB   ${bday_formatted}
    
    # # Click Button   id:btnUserFamilyBackgroundUpdate
    # # Execute Javascript    document.elementFromPoint(53.97, 94).click();
    # Wait Until Element Is Visible    xpath=//div[@id='updateFB']//button[text()='Save']    2s
    # Click Button                    xpath=//div[@id='updateFB']//button[text()='Save']

     # # Click Button    xpath=//*[@id="frmUserFamilyBadckgroundUpdate"]/div[3]/button[1]
    # Wait Until Element Is Visible    id:modalDynamicConfirmButtonYes
    # Click Button     id:modalDynamicConfirmButtonYes

    # Sleep    10s

    # Wait Until Element Is Visible     id:modalDynamicMessage     10s
    # Click Button     ID:modalDynamicButton

    # Sleep    10s

Remove Specific Family
    ${xpath}=     Set Variable    //*[@id="tblFBMember"]//tr[td[contains(text(), 'Children')]]//button[contains(text(), 'Remove')]
    
    Click Element    xpath=${xpath}

    Wait Until Element Is Visible    id:modalDynamicConfirmButtonYes
    Click Button    id:modalDynamicConfirmButtonYes

    Wait Until Element Is Visible    id:modalDynamicMessage    10s
    Click Button    ID:modalDynamicButton

Add Educational Background Form
    
    ${yyyy_from}=    Evaluate    random.randint(2010, 2015)    modules=random
    ${yyyy_to}=      Evaluate    ${yyyy_from} + 4

    ${file_path}=    Set Variable    C:/Users/ckcruz/Downloads/git-cheat-sheet.pdf

    Select From List By Value    id:acadEducLevel    3
    Select From List By Value    id:acadNameSchool    196
    Select From List By Value    id:acadDegree    32
    Select From List By Value    id:acadPeriodFrom    ${yyyy_from}
    Select From List By Value    id:acadPeriodTo    ${yyyy_to}

    Click Element    id:ifGraduated
    Select From List By Value    id:acadYearGraduated    ${yyyy_to}
    Choose File    id:acadMOV     ${file_path}
    
    Click Button    xpath=//*[@id="frmUserAcademicAdd"]/div/div[2]/button

    Wait Until Element Is Visible    id:modalDynamicConfirmButtonYes
    Click Button    id:modalDynamicConfirmButtonYes

    Wait Until Element Is Visible    id:modalDynamicMessage    10s
    Click Button    id:modalDynamicButton

Update Educational Background

    ${xpath_update}=     Set Variable    //*[@id="tblAcads"]//tr[td[contains(text(), 'GRADUATED')]]//button[contains(text(), 'Update')]    

    ${yyyy_from}=    Evaluate    random.randint(2010, 2015)    modules=random
    ${yyyy_to}=      Evaluate    ${yyyy_from} + 4

    ${file_path}=    Set Variable    C:/Users/ckcruz/Downloads/git-cheat-sheet.pdf

    Click Element    xpath=${xpath_update}

    Select From List By Value    id:UpdateacadNameSchool    197
    Select From List By Value    id:UpdateacadDegree    33
    Select From List By Value    id:UpdateacadPeriodFrom    ${yyyy_from}
    Select From List By Value    id:UpdateacadPeriodTo        ${yyyy_to}

    Select From List By Value     id:UpdateacadYearGraduated        ${yyyy_to}
    Choose File    id:UpdateacadMOV     ${file_path}
    
    Click Button    xpath=//*[@id="frmUserAcadsUpdate"]/div[2]/div[2]/button[2]

    Wait Until Element Is Visible    id:modalDynamicConfirmButtonYes
    Click Button    id:modalDynamicConfirmButtonYes

    Wait Until Element Is Visible    id:modalDynamicMessage    10s
    Click Button    id:modalDynamicButton

Remove Educational Background
    ${xpath_remove}=     Set Variable    //*[@id="tblAcads"]//tr[td[contains(text(), 'GRADUATED')]]//button[contains(text(), 'Remove')]
    
    Click Element    xpath=${xpath_remove}

    Wait Until Element Is Visible    id:modalDynamicConfirmButtonYes
    Click Button    id:modalDynamicConfirmButtonYes

    Wait Until Element Is Visible    id:modalDynamicMessage    10s
    Click Button    id:modalDynamicButton
    
Add Work Experience Form
    ${org_name}=    Company
    ${org_com_faker}=    Set Variable    ${org_name} - DUMMY TEST WORK
    ${job}=    FakerLibrary.Job
    
    ${date_from}=    Evaluate    (datetime.datetime.now() - datetime.timedelta(days=random.randint(15, 30))).strftime('%d-%m-%Y')    modules=random,datetime
    ${date_to}=    Evaluate    (datetime.datetime.now() - datetime.timedelta(days=random.randint(1, 14))).strftime('%d-%m')    modules=random,datetime

    ${file_path}=    Set Variable    C:/Users/ckcruz/Downloads/git-cheat-sheet.pdf

    Input Text    id:careerDateFrom    ${date_from}
    Input Text    id:careerDateTo   ${date_to}
    Input Text    id:careerPosition    ${job}
    Input Text    id:careerOrganization    ${org_com_faker}
    Input Text    id:careerSalary    20000
    Input Text    id:careerStatusAppointment    REGULAR
    Select From List By Label    id:careerGovt    NO
    Choose File    id:careerMOV    ${file_path}

    Click Button    xpath=//*[@id="frmUserCareerAdd"]/div/div[2]/button

    Wait Until Element Is Visible    id:modalDynamicConfirmButtonYes    10s
    Click Button    id:modalDynamicConfirmButtonYes

    Wait Until Element Is Visible    id:modalDynamicMessage    10s
    Click Button    id:modalDynamicButton

Update Work Experience Form
    ${org_name}=    Company
    ${org_com_faker}=    Set Variable    ${org_name} - DUMMY TEST WORK
    ${job}=    FakerLibrary.Job
    
    ${date_from}=    Evaluate    (datetime.datetime.now() - datetime.timedelta(days=random.randint(15, 30))).strftime('%d-%m-%Y')    modules=random,datetime
    ${date_to}=    Evaluate    (datetime.datetime.now() - datetime.timedelta(days=random.randint(1, 14))).strftime('%d-%m')    modules=random,datetime

    ${file_path}=    Set Variable    C:/Users/ckcruz/Downloads/git-cheat-sheet.pdf

    ${xpath_update}=     Set Variable    //*[@id="tblcareer"]//tr[td[contains(text(), 'DUMMY TEST WORK')]]//button[contains(text(), 'Update')]    

    Click Button    xpath=${xpath_update}
    Sleep    2s


    Input Text    id:UpdatecareerDateFrom    ${date_from}
    Input Text    id:UpdatecareerDateTo   ${date_to}
    Input Text    id:UpdatecareerPosition    ${job}
    Input Text    id:UpdatecareerOrganization    ${org_com_faker}
    Input Text    id:UpdatecareerSalary    20000
    Input Text    id:UpdatecareerStatusAppointment    REGULAR
    Select From List By Label    id:UpdatecareerGovtService    NO
    Choose File    id:UpdatecareerMOV    ${file_path}
    
    Click Button    xpath=//*[@id="frmUserCareerUpdate"]/div/div[2]/button[2]

    Wait Until Element Is Visible    id:modalDynamicConfirmButtonYes    10s
    Click Button    id:modalDynamicConfirmButtonYes

    Wait Until Element Is Visible    id:modalDynamicMessage    10s
    Click Button    id:modalDynamicButton

Remove Work Experience
    ${xpath}=     Set Variable    //*[@id="tblcareer"]//tr[td[contains(text(), 'DUMMY TEST WORK')]]//button[contains(text(), 'Remove')]
    
    Click Element    xpath=${xpath}

    Wait Until Element Is Visible    id:modalDynamicConfirmButtonYes
    Click Button    id:modalDynamicConfirmButtonYes

    Wait Until Element Is Visible    id:modalDynamicMessage    10s
    Click Button    ID:modalDynamicButton
    
Add Eligibility Credentials
    ${eligibilityVal}=    Evaluate    random.choice([11, 13, 21, 23, 30, 36, 43, 44, 47, 48, 50, 61, 62, 63, 69, 71, 80])    modules=random  
    ${eligibilityRatingVal}=     Evaluate    random.randint(80, 100)    random
    ${past_date_exam}=    Evaluate    (datetime.datetime.now() - datetime.timedelta(days=random.randint(1, 30))).strftime('%d-%m-%Y')    modules=random,datetime
    ${exam_place} =    FakerLibrary.City
    ${validity_val}=    Evaluate    (datetime.datetime.now() + datetime.timedelta(days=random.randint(1, 30))).strftime('%d-%m-%Y')    modules=random,datetime
    ${file_path}=    Set Variable    C:/Users/ckcruz/Downloads/git-cheat-sheet.pdf


    Wait Until Element Is Visible    id=eligibilityCredentials   10s
    Select From List By Value    id=eligibilityCredentials    ${eligibilityVal}
    Wait Until Element Is Visible    id=eligibilityRating   10s
    Input Text    id=eligibilityRating    ${eligibilityRatingVal}
    Wait Until Element Is Visible    id=eligibilityExamDate   10s
    Input Text    id=eligibilityExamDate    ${past_date_exam}
    Wait Until Element Is Visible    id=eligibilityPlaceExamination   10s
    Input Text    id=eligibilityPlaceExamination      ${exam_place}
    Wait Until Element Is Visible    id=eligibilityNumber  10s
    Input Text    id=eligibilityNumber    1234567890
    Wait Until Element Is Visible   id=eligibilityValidityDate   10s
    Input Text    id=eligibilityValidityDate    ${validity_val}
    Choose File    id=eligibilityMOV   ${file_path}
    Click Button    xpath=//*[@id="frmUserEligibilitydAdd"]/div/div[2]/button
    
    Wait Until Element Is Visible    id:modalDynamicConfirmButtonYes    10s
    Click Button    id:modalDynamicConfirmButtonYes

    Wait Until Element Is Visible    id:modalDynamicMessage    10s
    Click Button    ID:modalDynamicButton
    
Update Eligibility Credentials
    ${xpath_update}=     Set Variable    //*[@id="tblEligibility"]//tr[td[contains(text(), 'ENGINEER')]]//button[contains(text(), 'Update')]

    ${eligibilityVal}=    Evaluate    random.choice([11, 13, 21, 23, 30, 36, 43, 44, 47, 48, 50, 61, 62, 63, 69, 71, 80])    modules=random  
    ${eligibilityRatingVal}=     Evaluate    random.randint(80, 100)    random
    ${past_date_exam}=    Evaluate    (datetime.datetime.now() - datetime.timedelta(days=random.randint(1, 30))).strftime('%d-%m-%Y')    modules=random,datetime
    ${exam_place} =    FakerLibrary.City
    ${validity_val}=    Evaluate    (datetime.datetime.now() + datetime.timedelta(days=random.randint(1, 30))).strftime('%d-%m-%Y')    modules=random,datetime
    ${file_path}=    Set Variable    C:/Users/ckcruz/Downloads/git-cheat-sheet.pdf
    
    Click Element    xpath=${xpath_update}

    Wait Until Element Is Visible    id=UpdateeligibilityRating   10s
    Input Text    id=UpdateeligibilityRating    ${eligibilityRatingVal}
    Wait Until Element Is Visible    id=UpdateeligibilityExamDate   10s
    Input Text    id=UpdateeligibilityExamDate    ${past_date_exam}
    Wait Until Element Is Visible    id=eligibilityPlaceExamination   10s
    Input Text    id=UpdateeligibilityPlaceExamination      ${exam_place}
    Wait Until Element Is Visible    id=UpdateeligibilityNumber  10s
    Input Text    id=UpdateeligibilityNumber    1234567890
    Wait Until Element Is Visible   id=UpdateeligibilityValidityDate   10s
    Input Text    id=UpdateeligibilityValidityDate    ${validity_val}
    Choose File    id=UpdateEligibilityMOV   ${file_path}
    Click Button   xpath=//*[@id="frmUserEligibilitydUpdate"]/div[2]/button[2]

    Wait Until Element Is Visible    id:modalDynamicConfirmButtonYes    10s
    Click Button    id:modalDynamicConfirmButtonYes

    Wait Until Element Is Visible    id:modalDynamicMessage    10s
    Click Button    ID:modalDynamicButton

Remove Eligibility Credentials
    ${xpath_remove}=     Set Variable    //*[@id="tblEligibility"]//tr[td[contains(text(), 'ENGINEER')]]//button[contains(text(), 'Remove')]

    Click Element    xpath=${xpath_remove}

    Wait Until Element Is Visible    id:modalDynamicConfirmButtonYes
    Click Button    id:modalDynamicConfirmButtonYes

    Wait Until Element Is Visible    id:modalDynamicMessage    10s
    Click Button    ID:modalDynamicButton

Add Voluntary Work
    ${date_from}=    Evaluate    (datetime.datetime.now() - datetime.timedelta(days=random.randint(15, 30))).strftime('%d-%m-%Y')    modules=random,datetime
    ${date_to}=      Evaluate    (datetime.datetime.now() - datetime.timedelta(days=random.randint(1, 14))).strftime('%d-%m-%Y')    modules=random,
    
    ${org_name}=    Company

    ${org_com_faker}=    Set Variable    ${org_name} - DUMMY TEST VOLUNTARY
    
    ${job}=    FakerLibrary.Job

    Wait Until Element Is Visible    id=voluntaryNAO    10s
    Input Text    id=voluntaryNAO    ${org_com_faker}

    Click Element    id=voluntaryDateFrom
    Press Keys    id=voluntaryDateFrom    ${date_from}

    Wait Until Element Is Visible    id=voluntaryDateTo    10s
    Input Text    id=voluntaryDateTo    ${date_to}
    
    Wait Until Element Is Visible    id=voluntaryTotalHrs    10s
    Input Text    id=voluntaryTotalHrs    8
    
    Wait Until Element Is Visible    id=voluntaryPosition    10s
    Input Text    id=voluntaryPosition    ${job}

    Click Button    xpath=//*[@id="frmUserVoluntaryAdd"]/div/div[2]/button

    Wait Until Element Is Visible    id:modalDynamicConfirmButtonYes    10s
    Click Button    id:modalDynamicConfirmButtonYes

    Wait Until Element Is Visible    id:modalDynamicMessage    10s
    Click Button    ID:modalDynamicButton

Update Voluntary Work    
    ${xpath_update}=     Set Variable    //*[@id="tblVoluntary"]//tr[td[contains(text(), 'DUMMY TEST VOLUNTARY')]]//button[contains(text(), 'Update')]    
    
    ${org_name}=    Company
    ${org_com_faker}=    Set Variable    ${org_name} - DUMMY TEST VOLUNTARY
    ${job}=    FakerLibrary.Job

    ${date_from}=    Evaluate    (datetime.datetime.now() - datetime.timedelta(days=random.randint(15, 30))).strftime('%d-%m-%Y')    modules=random,datetime
    ${date_to}=      Evaluate    (datetime.datetime.now() - datetime.timedelta(days=random.randint(1, 14))).strftime('%d-%m-%Y')    modules=random,

    Click Button   xpath=${xpath_update}
    Wait Until Element Is Visible    id:UpdatevoluntaryNAO    10s
    Input Text    id=UpdatevoluntaryNAO    ${org_com_faker}
    
    Wait Until Element Is Visible    id:UpdatevoluntaryDateFrom    10s
    Input Text    id:UpdatevoluntaryDateFrom    ${date_from}

    Wait Until Element Is Visible    id:UpdatevoluntaryDateTo    10s
    Input Text    id=UpdatevoluntaryDateTo    ${date_to}

    Wait Until Element Is Visible    id:UpdatevoluntaryTotalHrs    10s
    Input Text    id=UpdatevoluntaryTotalHrs    8

    Wait Until Element Is Visible    id:UpdatevoluntaryPosition    10s
    Input Text    id=UpdatevoluntaryPosition    ${job}

    Click Button    xpath=//*[@id="frmUserVoluntaryUpdate"]/div/div[2]/button[2]

    Wait Until Element Is Visible    id:modalDynamicConfirmButtonYes    10s
    Click Button    id:modalDynamicConfirmButtonYes

    Wait Until Element Is Visible    id:modalDynamicMessage    10s
    Click Button    ID:modalDynamicButton
Remove Voluntary Work
    ${xpath_remove}=     Set Variable    //*[@id="tblVoluntary"]//tr[td[contains(text(), '8')]]//button[contains(text(), 'Remove')]
       
    Click Button    xpath=${xpath_remove}
    Wait Until Element Is Visible    id:modalDynamicConfirmButtonYes    10s
    Click Button    id:modalDynamicConfirmButtonYes

    Wait Until Element Is Visible    id:modalDynamicMessage    10s
    Click Button    ID:modalDynamicButton


Add Specific Training Form
    ${training_name}    FakerLibrary.Bs
    ${date_from}=    Evaluate    (datetime.datetime.now() - datetime.timedelta(days=random.randint(15, 30))).strftime('%d-%m-%Y')    modules=random,datetime
    ${date_to}=      Evaluate    (datetime.datetime.now() - datetime.timedelta(days=random.randint(1, 14))).strftime('%d-%m-%Y')    modules=random,
    ${first}=    FakerLibrary.First Name
    ${last}=     FakerLibrary.Last Name
    ${full_name}=    Catenate    SEPARATOR=    ${first} ${last}
    ${file_path}=    Set Variable    C:/Users/ckcruz/Downloads/git-cheat-sheet.pdf
    ${training_name_faker}=    Set Variable    ${training_name} - DUMMY TEST TRAINING

    Input Text    id=trainingTitle    ${training_name_faker}
    Input Text    id=trainingDateFrom    ${date_from}
    Input Text    id=trainingDateTo    ${date_to}
    Input Text    id=trainingHours    8
    Select From List By Value   id=trainingType    3
    Input Text    id=trainingConductedBy    ${full_name}
    Choose File    id=trainingUploadMOV    ${file_path}

    Click Button    xpath=//*[@id="frmUserTrainingAdd"]/div/div[2]/button

    Wait Until Element Is Visible    id:modalDynamicConfirmButtonYes    10s
    Click Button    id:modalDynamicConfirmButtonYes

    Wait Until Element Is Visible    id:modalDynamicMessage    10s
    Click Button    ID:modalDynamicButton

Update Specific Training
    ${xpath_update}=     Set Variable    //*[@id="tbltraining"]//tr[td[contains(text(), 'DUMMY TEST TRAINING')]]//button[contains(text(), 'Update')]    
    ${training_name}    FakerLibrary.Bs
    ${date_from}=    Evaluate    (datetime.datetime.now() - datetime.timedelta(days=random.randint(15, 30))).strftime('%d-%m-%Y')    modules=random,datetime
    ${date_to}=      Evaluate    (datetime.datetime.now() - datetime.timedelta(days=random.randint(1, 14))).strftime('%d-%m-%Y')    modules=random,
    ${first}=    FakerLibrary.First Name
    ${last}=     FakerLibrary.Last Name
    ${full_name}=    Catenate    SEPARATOR=    ${first} ${last}
    ${file_path}=    Set Variable    C:/Users/ckcruz/Downloads/git-cheat-sheet.pdf
    ${training_name_faker}=    Set Variable    ${training_name} - DUMMY TEST TRAINING
    
    Click Button    ${xpath_update}
    Sleep    2s
    Input Text    id=updatetrainingTitle    ${training_name_faker}
    Input Text    id=updatetrainingDateFrom    ${date_from}
    Input Text    id=updatetrainingDateTo    ${date_to}
    Input Text    id=updatetrainingHours    8
    Select From List By Value   id=updatetrainingType    3
    Input Text    id=updatetrainingConductedBy    ${full_name}
    Choose File    id=UpdateTrainingMOV    ${file_path}

    Click Button    xpath=//*[@id="frmUserTrainingdUpdate"]/div[2]/div[2]/button[2]

    Wait Until Element Is Visible    id:modalDynamicConfirmButtonYes    10s
    Click Button    id:modalDynamicConfirmButtonYes

    Wait Until Element Is Visible    id:modalDynamicMessage    10s
    Click Button    ID:modalDynamicButton


Remove Specific Training    
    ${xpath_remove}=     Set Variable    //*[@id="tbltraining"]//tr[td[contains(text(), 'TECHNICAL')]]//button[contains(text(), 'Remove')]
    
    Click Button    xpath=${xpath_remove}
    Wait Until Element Is Visible    id:modalDynamicConfirmButtonYes    10s
    Click Button    id:modalDynamicConfirmButtonYes

    Wait Until Element Is Visible    id:modalDynamicMessage    10s
    Click Button    ID:modalDynamicButton

Add Specific Special Skills and Hobbies
    ${skill_name}    FakerLibrary.Bs
    ${skill_name_faker}=    Set Variable    ${skill_name} - DUMMY TEST
    
    Input Text    id=skillsTitle    ${skill_name_faker}
    Click Button    xpath=//*[@id="frmUserSkillsAdd"]/div/div[2]/button

    Wait Until Element Is Visible    id:modalDynamicConfirmButtonYes    10s
    Click Button    id:modalDynamicConfirmButtonYes
    
    Wait Until Element Is Visible    id:modalDynamicMessage    10s
    Click Button    ID:modalDynamicButton

Update Specific Special Skills and Hobbies
    ${xpath_update}=     Set Variable    //*[@id="tblSkills"]//tr[td[contains(text(), 'DUMMY TEST')]]//button[contains(text(), 'Update')]    
    ${skill_name}    FakerLibrary.Bs
    ${skill_name_faker}=    Set Variable    ${skill_name} - DUMMY TEST
    
    Click Button    xpath=${xpath_update}
    Sleep    2s
    Input Text    id=updateskillsTitle    ${skill_name_faker}

    Click Button    xpath=//*[@id="frmUserSkillsUpdate"]/div/div[2]/button[2]

    Wait Until Element Is Visible    id:modalDynamicConfirmButtonYes    10s
    Click Button    id:modalDynamicConfirmButtonYes
    
    Wait Until Element Is Visible    id:modalDynamicMessage    10s
    Click Button    ID:modalDynamicButton

Remove Specific Special Skills and Hobbies
    ${xpath_remove}=     Set Variable    //*[@id="tblSkills"]//tr[td[contains(text(), 'DUMMY TEST')]]//button[contains(text(), 'Remove')]
    
    Click Button    xpath=${xpath_remove}
    Wait Until Element Is Visible    id:modalDynamicConfirmButtonYes    10s
    Click Button    id:modalDynamicConfirmButtonYes

    Wait Until Element Is Visible    id:modalDynamicMessage    10s
    Click Button    ID:modalDynamicButton

Add Non Academic Distinction
    ${distinction_name}    FakerLibrary.Bs
    ${distinction_name_faker}=    Set Variable    ${distinction_name} - DUMMY TEST
    
    Input Text    id=nonAcademicTitle    ${distinction_name_faker}
    Click Button    xpath=//*[@id="frmUsernonAcademicAdd"]/div/div[2]/button
    
    Wait Until Element Is Visible    id:modalDynamicConfirmButtonYes    10s
    Click Button    id:modalDynamicConfirmButtonYes
    
    Wait Until Element Is Visible    id:modalDynamicMessage    10s    
    Click Button    ID:modalDynamicButton

Update Non Academic Distinction
    ${xpath_update}=     Set Variable    //*[@id="tblnonAcademic"]//tr[td[contains(text(), 'DUMMY TEST')]]//button[contains(text(), 'Update')]    
    ${distinction_name}    FakerLibrary.Bs
    ${distinction_name_faker}=    Set Variable    ${distinction_name} - DUMMY TEST
    
    Click Button    xpath=${xpath_update}
    Sleep    2s
    Input Text    id=updateNonAcademicTitle    ${distinction_name_faker}

    Click Button    xpath=//*[@id="frmUserNonAcademicUpdate"]/div/div[2]/button[2]

    Wait Until Element Is Visible    id:modalDynamicConfirmButtonYes    10s
    Click Button    id:modalDynamicConfirmButtonYes

    Wait Until Element Is Visible    id:modalDynamicMessage    10s    
    Click Button    ID:modalDynamicButton

Remove Non Academic Distinction
     ${xpath_remove}=     Set Variable    //*[@id="tblnonAcademic"]//tr[td[contains(text(), 'DUMMY TEST')]]//button[contains(text(), 'Remove')]    
        
      Click Button    xpath=${xpath_remove}
      Sleep    2s
      Wait Until Element Is Visible    id:modalDynamicConfirmButtonYes    10s
      Click Button    id:modalDynamicConfirmButtonYes

      Wait Until Element Is Visible    id:modalDynamicMessage    10s    
      Click Button    ID:modalDynamicButton

Add Specific Reference
    ${address}    FakerLibrary.Address
    ${phone}     Numerify    09%%%%%%%%% 
    ${first}=    FakerLibrary.First Name
    ${last}=     FakerLibrary.Last Name
    ${full_name}=    Catenate    SEPARATOR=    ${first} ${last} DUMMY
    ${address_faker}=    Catenate    SEPARATOR=    ${address} 

    Input Text     id=referencesName    ${full_name}
    Input Text     id=referencesAddress    ${address_faker}     
    Input Text     id=referencesMobile    ${phone}

    Click Button    xpath=//*[@id="frmUserReferencesAdd"]/div/div[2]/button

    Wait Until Element Is Visible    id:modalDynamicConfirmButtonYes    10s
    Click Button    id:modalDynamicConfirmButtonYes

    Wait Until Element Is Visible    id:modalDynamicMessage    10s    
    Click Button    ID:modalDynamicButton

Update Specific Reference
    ${xpath_update}=     Set Variable    //*[@id="tblReferences"]//tr[td[contains(text(), 'DUMMY')]]//button[contains(text(), 'Update')]    
    ${address}    FakerLibrary.Address
    ${phone}     Numerify    09%%%%%%%%% 
    ${first}=    FakerLibrary.First Name
    ${last}=     FakerLibrary.Last Name
    ${full_name}=    Catenate    SEPARATOR=    ${first} ${last} DUMMY
    ${address_faker}=    Catenate    SEPARATOR=    ${address}

    Click Button    xpath=${xpath_update}
    
    Wait Until Element Is Visible    id=updateReferencesName    timeout=10s
    Input Text     id=updateReferencesName    ${full_name}        

    Wait Until Element Is Visible    id=updateReferencesAddress    timeout=10s
    Input Text     id=updateReferencesAddress    ${address_faker}     

    Wait Until Element Is Visible    id:modalDynamicConfirmButtonYes    10s
    Click Button    id:modalDynamicConfirmButtonYes

    Wait Until Element Is Visible    id:modalDynamicMessage    10s    
    Click Button    ID:modalDynamicButton

Remove Specific Reference
    ${xpath_remove}=     Set Variable    //*[@id="tblReferences"]//tr[td[contains(text(), 'DUMMY')]]//button[contains(text(), 'Remove')]    
        
    Click Button    xpath=${xpath_remove}
    Sleep    2s
    Wait Until Element Is Visible    id:modalDynamicConfirmButtonYes    10s
    Click Button    id:modalDynamicConfirmButtonYes

    Wait Until Element Is Visible    id:modalDynamicMessage    10s    
    Click Button    id:modalDynamicButton

Government ID Form
    ${id_name}    FakerLibrary.Bs
    ${id_name_faker}=    Set Variable    ${id_name} - DUMMY TEST
    ${idNoVal}=    Numerify    %%%%-%%%%-%%%%
    ${idIssuedDate}=    Evaluate    (datetime.datetime.now() - datetime.timedelta(days=random.randint(15, 30))).strftime('%d-%m-%Y')    modules=random,datetime

    Input Text    id=GovernIDTitle    ${id_name_faker}
    Input Text    id=GovernIDNo    ${idNoVal}
    Input Text    id=GovernIDDateIssue    ${idIssuedDate}
    Select From List By Value    id:GovernIDPlaceIssue    013301000

    Click Button     xpath=//*[@id="frmUserGovernID"]/div/div[2]/button

    Wait Until Element Is Visible    id:modalDynamicConfirmButtonYes    10s
    Click Button    id:modalDynamicConfirmButtonYes

    Wait Until Element Is Visible    id:modalDynamicMessage    10s    
    Click Button    ID:modalDynamicButton

Fill Up Other Infromation (Part 2)
    
    FOR    ${id}    IN    @{arrRadio}
        Click Element    id=${id}
    END
    
    Click Button    id:submit_other_info

    Wait Until Element Is Visible    id:modalDynamicConfirmButtonYes    10s
    Click Button    id:modalDynamicConfirmButtonYes

    Wait Until Element Is Visible    id:modalDynamicMessage    10s    
    Click Button    ID:modalDynamicButton

    
