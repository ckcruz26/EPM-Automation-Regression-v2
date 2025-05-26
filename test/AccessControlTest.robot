*** Settings ***
Library    SeleniumLibrary
Library      FakerLibrary
Resource    ../resource/EPM-Resource.robot
Resource    ../suite-config-teardown/SuiteConfigTeardown.robot
Resource    ../pages/AccessControlPage.robot


Library    BuiltIn  

Suite Setup       Open Browser and Login
Suite Teardown    Close Browser Interaction


*** Test Cases ***
[EPM_REGRESSION_ACCESS_CONTROL_ST_001]
    [Tags]     EPM_REGRESSION_ACCESS_CONTROL_ST_001
    TRY
        Open Access Control Page
    EXCEPT    Error
        Fatal Error
    END
[EPM_REGRESSION_ACCESS_CONTROL_ST_002]
    [Tags]     EPM_REGRESSION_ACCESS_CONTROL_ST_002
    TRY
        Open Access Control Page
        Set Bulk Access Control
    EXCEPT    Error
        Fatal Error
    END

[EPM_REGRESSION_ACCESS_CONTROL_ST_003]
    [Tags]     EPM_REGRESSION_ACCESS_CONTROL_ST_003
    TRY
        Open Access Control Page
        Remove Access Control
    EXCEPT    Error
        Fatal Error
    END

[EPM_REGRESSION_ACCESS_CONTROL_ST_004]
    [Tags]     EPM_REGRESSION_ACCESS_CONTROL_ST_004
    TRY
        Open Access Control Page
        Filtering Users in EPM
    EXCEPT    Error
        Fatal Error
    END