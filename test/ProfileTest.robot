*** Settings ***
Library    SeleniumLibrary
Library      FakerLibrary
Resource    ../resource/EPM-Resource.robot
Resource    ../suite-config-teardown/SuiteConfigTeardown.robot
Resource    ../pages/ProfilePage.robot

Library    BuiltIn  

Suite Setup       Open Browser and Login
Suite Teardown    Close Browser Interaction

*** Test Cases ***
[EPM_PROFILE_REGRESSION_ST_001]
    [Tags]  EPM_PROFILE_REGRESSION_ST_001
    Skip    This test is skipped due to unable to perform automate this operation.
   
[EPM_PROFILE_REGRESSION_ST_002]
    [Tags]    EPM_PROFILE_REGRESSION_ST_002
    TRY
        Go To Profile Page
        Bank Details Form 
    EXCEPT    Error
        Fatal Error
    END

[EPM_PROFILE_REGRESSION_ST_003]
    [Tags]    EPM_PROFILE_REGRESSION_ST_003
    TRY
        Go To Profile Page
        Check If Overview Tab Is Active
    EXCEPT   Error
        Fatal Error
    END

[EPM_REGRESSION_PROFILE_ST_004]
    [Tags]    EPM_REGRESSION_PROFILE_ST_004
    TRY
        Go To Profile Page
        Click Element    xpath=/html/body/div[2]/div/section/div/div[2]/div/ul/li[2]/a
        Check If Basic Information Tab Is Active
        Fill Up Basic Information Form
    EXCEPT  Error
        Fatal Error
    END
[EPM_REGRESSION_PROFILE_ST_005]
    [Tags]    EPM_REGRESSION_PROFILE_ST_005
    TRY
        Go To Profile Page
        Click Element    xpath=/html/body/div[2]/div/section/div/div[2]/div/ul/li[3]/a
        Check If Other Information Tab Is Active
        Fill Up Other Information Form
    EXCEPT  Error
        Fatal Error
    END

[EPM_REGRESSION_PROFILE_ST_006]
    [Tags]    EPM_REGRESSION_PROFILE_ST_006
    TRY
        Go To Profile Page
        Click Element    xpath=/html/body/div[2]/div/section/div/div[2]/div/ul/li[4]/a
        Check If Family Background Tab Is Active
            FOR    ${i}    IN RANGE    3
                Add Family Background Form
            END
    EXCEPT  Error
        Fatal Error
    END

[EPM_REGRESSION_PROFILE_ST_007]
    [Tags]    EPM_REGRESSION_PROFILE_ST_007
    Skip    This test is skipped due to unable to perform automate this operation.
    # TRY
    #     Go To Profile Page
    #     Click Element    xpath=/html/body/div[2]/div/section/div/div[2]/div/ul/li[4]/a
    #     Check If Family Background Tab Is Active
    #     Update Family Background
    # EXCEPT   Error
    #     Fatal Error
    # END

[EPM_REGRESSION_PROFILE_ST_008]
    [Tags]    EPM_REGRESSION_PROFILE_ST_008
    TRY
        Go To Profile Page
        Click Element    xpath=/html/body/div[2]/div/section/div/div[2]/div/ul/li[4]/a
        Remove Specific Family
    EXCEPT  Error
        Fatal Error
    END

[EPM_REGRESSION_PROFILE_ST_009]
    [Tags]    EPM_REGRESSION_PROFILE_ST_009
    TRY
        Go To Profile Page
        Click Element    xpath=/html/body/div[2]/div/section/div/div[2]/div/ul/li[5]/a
        Check If Educational Background Tab Is Active
        Add Educational Background Form
    EXCEPT  Error
        Fatal Error
    END

[EPM_REGRESSION_PROFILE_ST_010]
    [Tags]    EPM_REGRESSION_PROFILE_ST_010
    TRY
        Go To Profile Page
        Click Element    xpath=/html/body/div[2]/div/section/div/div[2]/div/ul/li[5]/a
        Check If Educational Background Tab Is Active
        Update Educational Background
    EXCEPT    Error
        Fatal Error
    END

[EPM_REGRESSION_PROFILE_ST_011]
    [Tags]    EPM_REGRESSION_PROFILE_ST_011
    TRY
        Go To Profile Page
        Click Element    xpath=/html/body/div[2]/div/section/div/div[2]/div/ul/li[5]/a
        Check If Educational Background Tab Is Active
        Remove Educational Background
    EXCEPT    Error
        Fatal Error
    END

[EPM_REGRESSION_PROFILE_ST_012]
    [Tags]    EPM_REGRESSION_PROFILE_ST_012
    TRY
        Go To Profile Page
        Click Element    xpath=/html/body/div[2]/div/section/div/div[2]/div/ul/li[6]/a
        Check If Eligbility Tab Is Active
        FOR    ${i}    IN RANGE    3
            Add Eligibility Credentials 
        END
    EXCEPT  Error
        Fatal Error
    END

[EPM_REGRESSION_PROFILE_ST_013]
    [Tags]    EPM_REGRESSION_PROFILE_ST_013
    TRY
        Go To Profile Page
        Click Element    xpath=/html/body/div[2]/div/section/div/div[2]/div/ul/li[6]/a
        Check If Eligbility Tab Is Active
        Update Eligibility Credentials    
    EXCEPT  Error
        Fatal Error
    END

[EPM_REGRESSION_PROFILE_ST_014]
    [Tags]    EPM_REGRESSION_PROFILE_ST_014
    TRY
        Go To Profile Page
        Click Element    xpath=/html/body/div[2]/div/section/div/div[2]/div/ul/li[6]/a
        Check If Eligbility Tab Is Active
        Remove Eligibility Credentials 
    EXCEPT  Error
        Fatal Error
    END

[EPM_REGRESSION_PROFILE_ST_015]
    [Tags]    EPM_REGRESSION_PROFILE_ST_015
    TRY
        Go To Profile Page
        Click Element    xpath=/html/body/div[2]/div/section/div/div[2]/div/ul/li[7]/a
        Check If Work Experience Tab is Active
        Add Work Experience Form
    EXCEPT   Error
        Fatal Error
    END

[EPM_REGRESSION_PROFILE_ST_016]
    [Tags]    EPM_REGRESSION_PROFILE_ST_016
    TRY
        Go To Profile Page
        Click Element    xpath=/html/body/div[2]/div/section/div/div[2]/div/ul/li[7]/a
        Check If Work Experience Tab is Active
        Update Work Experience Form
    EXCEPT   Error
        Fatal Error
    END

[EPM_REGRESSION_PROFILE_ST_017]
    [Tags]    EPM_REGRESSION_PROFILE_ST_017
    TRY
        Go To Profile Page
        Click Element    xpath=/html/body/div[2]/div/section/div/div[2]/div/ul/li[7]/a
        Check If Work Experience Tab is Active
        Remove Work Experience 
    EXCEPT   Error
        Fatal Error
    END

[EPM_REGRESSION_PROFILE_ST_018]
    [Tags]    EPM_REGRESSION_PROFILE_ST_018
    TRY
        Go To Profile Page
        Click Element    xpath=/html/body/div[2]/div/section/div/div[2]/div/ul/li[8]/a
        Check If Voluntary Work Is Active
        Add Voluntary Work
    EXCEPT   Error
        Fatal Error
    END

[EPM_REGRESSION_PROFILE_ST_019]
    [Tags]    EPM_REGRESSION_PROFILE_ST_019
    TRY
        Go To Profile Page
        Click Element    xpath=/html/body/div[2]/div/section/div/div[2]/div/ul/li[8]/a
        Check If Voluntary Work Is Active
        Update Voluntary Work 
    EXCEPT   Error
        Fatal Error
    END

[EPM_REGRESSION_PROFILE_ST_020]
    [Tags]    EPM_REGRESSION_PROFILE_ST_019
    TRY
        Go To Profile Page
        Click Element    xpath=/html/body/div[2]/div/section/div/div[2]/div/ul/li[8]/a
        Check If Voluntary Work Is Active
        Remove Voluntary Work
        Sleep   5s
    EXCEPT   Error
        Fatal Error
    END

[EPM_REGRESSION_PROFILE_ST_021]
    [Tags]    EPM_REGRESSION_PROFILE_ST_021
    TRY
        Go To Profile Page
        Click Element    xpath=/html/body/div[2]/div/section/div/div[2]/div/ul/li[9]/a
        Check If Training Tab Is Active
        Add Specific Training Form
    EXCEPT   Error
        Fatal Error
    END

[EPM_REGRESSION_PROFILE_ST_022]
    [Tags]    EPM_REGRESSION_PROFILE_ST_022
    TRY
        Go To Profile Page
        Click Element    xpath=/html/body/div[2]/div/section/div/div[2]/div/ul/li[9]/a
        Check If Training Tab Is Active
        Update Specific Training
    EXCEPT   Error
        Fatal Error
    END

[EPM_REGRESSION_PROFILE_ST_023]
    [Tags]    EPM_REGRESSION_PROFILE_ST_021
    TRY
        Go To Profile Page
        Click Element    xpath=/html/body/div[2]/div/section/div/div[2]/div/ul/li[9]/a
        Check If Training Tab Is Active
        Remove Specific Training
    EXCEPT   Error
        Fatal Error
    END

[EPM_REGRESSION_PROFILE_ST_024]
    [Tags]    EPM_REGRESSION_PROFILE_ST_024
    TRY
        Go To Profile Page
        Click Element    xpath=/html/body/div[2]/div/section/div/div[2]/div/ul/li[10]/a
        Check If Special Skills Tab Is Active
        FOR    ${index}    IN RANGE    3
            Add Specific Special Skills and Hobbies
        END
    EXCEPT   Error
        Fatal Error
    END    

[EPM_REGRESSION_PROFILE_ST_025]
    [Tags]    EPM_REGRESSION_PROFILE_ST_025
    TRY
        Go To Profile Page
        Click Element    xpath=/html/body/div[2]/div/section/div/div[2]/div/ul/li[10]/a
        Check If Special Skills Tab Is Active
        Update Specific Special Skills and Hobbies
    EXCEPT   Error
        Fatal Error
    END    

[EPM_REGRESSION_PROFILE_ST_026]
    [Tags]    EPM_REGRESSION_PROFILE_ST_026
    TRY
        Go To Profile Page
        Click Element    xpath=/html/body/div[2]/div/section/div/div[2]/div/ul/li[10]/a
        Check If Special Skills Tab Is Active
        Remove Specific Special Skills and Hobbies
    EXCEPT   Error
        Fatal Error
    END

[EPM_REGRESSION_PROFILE_ST_027]
    [Tags]    EPM_REGRESSION_PROFILE_ST_027
    TRY
        Go To Profile Page
        Click Element    xpath=/html/body/div[2]/div/section/div/div[2]/div/ul/li[11]/a
        Check If Non Academic Distinction Tab Is Active
        FOR    ${index}    IN RANGE    3
            Add Non Academic Distinction
        END
    EXCEPT   Error
        Fatal Error
    END

[EPM_REGRESSION_PROFILE_ST_028]
    [Tags]    EPM_REGRESSION_PROFILE_ST_028
    TRY
        Go To Profile Page
        Click Element    xpath=/html/body/div[2]/div/section/div/div[2]/div/ul/li[11]/a
        Check If Non Academic Distinction Tab Is Active
        Update Non Academic Distinction
    EXCEPT   Error
        Fatal Error
    END

[EPM_REGRESSION_PROFILE_ST_029]
    [Tags]    EPM_REGRESSION_PROFILE_ST_029
    TRY
        Go To Profile Page
        Click Element    xpath=/html/body/div[2]/div/section/div/div[2]/div/ul/li[11]/a
        Check If Non Academic Distinction Tab Is Active
        Remove Non Academic Distinction
    EXCEPT   Error
        Fatal Error
    END

[EPM_REGRESSION_PROFILE_ST_030]
    [Tags]    EPM_REGRESSION_PROFILE_ST_030
    TRY
        Go To Profile Page
        Click Element    xpath=/html/body/div[2]/div/section/div/div[2]/div/ul/li[12]/a
        Check If Reference Tab Is Active
        Add Specific Reference
    EXCEPT   Error
        Fatal Error
    END

[EPM_REGRESSION_PROFILE_ST_031]
    [Tags]    EPM_REGRESSION_PROFILE_ST_031
    TRY
        Go To Profile Page
        Click Element    xpath=/html/body/div[2]/div/section/div/div[2]/div/ul/li[12]/a
        Check If Reference Tab Is Active
        Update Specific Reference
    EXCEPT   Error
        Fatal Error
    END

[EPM_REGRESSION_PROFILE_ST_032]
    TRY
        Go To Profile Page
        Click Element    xpath=/html/body/div[2]/div/section/div/div[2]/div/ul/li[12]/a
        Check If Reference Tab Is Active
        Remove Specific Reference
    EXCEPT   Error
        Fatal Error
    END

[EPM_REGRESSION_PROFILE_ST_033]
    TRY
        Go To Profile Page
        Click Element    xpath=/html/body/div[2]/div/section/div/div[2]/div/ul/li[13]/a
        Check If Government Issued ID Tab is Active
        Government ID Form
    EXCEPT   Error
        Fatal Error
    END

[EPM_REGRESSION_PROFILE_ST_034]
    TRY
        Go To Profile Page
        Click Element    xpath=/html/body/div[2]/div/section/div/div[2]/div/ul/li[14]/a
        Check If Other Information (Part 2) Tab is Active
        Fill Up Other Infromation (Part 2)
    EXCEPT    Error
        Fatal Error
    END