*** Settings ***
Library    SeleniumLibrary
Library    ../venv/Lib/site-packages/robot/libraries/OperatingSystem.py
Resource    ../resource/EPM-Resource.robot
Library  OperatingSystem

Resource    ../suite-config-teardown/SuiteConfigTeardown.robot
Resource    ../pages/SanityPage.robot


Suite Setup       Open Browser and Login
Suite Teardown    Close Browser Interaction


*** Test Cases ***
[EPM_SANITY_001]
    [Tags]     EPM__SANITY_001
    [Documentation]    This is new feature in Profile Page to upload profile picture
    TRY
         ${resource_dir}=    Normalize Path    ${CURDIR}/../resource/pusa.jpg
        Go To Profile Page
        Upload Profile Picture    ${resource_dir}
    EXCEPT    Error
        Fatal Error
    END

[EPM_SANITY_002]
    [Tags]     EPM__SANITY_002
    [Documentation]    This is new feature in User Management Page to update date filled 
    TRY
        Go to User Management Page
        User Management Page Update Date Filled
    EXCEPT    Error
        Fatal Error
    END

[EPM_SANITY_003]
    [Tags]    EPM__SANITY_003
    [Documentation]    This is new feature in User Management Page to update date and increment step
    TRY
        Go to User Management Page
        User Management Page Update Date and Increment Step
    EXCEPT    Error
        Fatal Error
    END