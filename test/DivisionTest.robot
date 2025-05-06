*** Settings ***
Library    SeleniumLibrary
Resource     ../resource/EPM-Resource.robot
Resource    ../suite-config-teardown/SuiteConfigTeardown.robot
Resource    ../pages/DivisionPage.robot


Test Teardown    Close Browser Interaction


*** Test Cases ***

[EPM_REGRESSION_DIVISION_ST_001]
    [Tags]     EPM_REGRESSION_DIVISION_ST_001
    TRY
        Open Browser and Login
        Redirect to Division Module
    EXCEPT    Error
        Fatal Error
    END

[EPM_REGRESSION_DIVISION_ST_002]
    [Tags]     EPM_REGRESSION_DIVISION_ST_002
    TRY
        Open Browser and Login
        Redirect to Division Module
        FOR    ${i}    IN RANGE    3
            Add Division Name
        END
    EXCEPT    Error
        Fatal Error
    END

[EPM_REGRESSION_DIVISION_ST_003]
    [Tags]     EPM_REGRESSION_DIVISION_ST_003
    TRY
        Open Browser and Login
        Redirect to Division Module
         Update Division
    EXCEPT    Error
        Fatal Error
    END
[EPM_REGRESSION_DIVISION_ST_004]
    [Tags]     EPM_REGRESSION_DIVISION_ST_004
    TRY
        Open Browser and Login
        Redirect to Division Module
        Remove Division
    EXCEPT    Error
        Fatal Error
    END