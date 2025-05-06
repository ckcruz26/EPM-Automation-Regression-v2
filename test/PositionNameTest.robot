*** Settings ***
Library    SeleniumLibrary

Resource    ../resource/EPM-Resource.robot

Resource    ../suite-config-teardown/SuiteConfigTeardown.robot
Resource    ../pages/PositionNamePage.robot


Test Teardown    Close Browser Interaction


*** Test Cases ***


[EPM_POSITION_NAME_REGRESSION_ST_001]
    [Tags]     EPM_POSITION_NAME_REGRESSION_ST_001
    TRY
        Open Browser and Login
        Redirect to Position Name Module
    EXCEPT    Error
        Fatal Error
    END

[EPM_POSITION_NAME_REGRESSION_ST_002]
    [Tags]     EPM_POSITION_NAME_REGRESSION_ST_002
    TRY
        Open Browser and Login
        Redirect to Position Name Module
        Add a Position Name
    EXCEPT    Error
        Fatal Error
    END

[EPM_POSITION_NAME_REGRESSION_ST_003]
    [Tags]    EPM_POSITION_NAME_REGRESSION_ST_003
    TRY
        Open Browser and Login
        Redirect to Position Name Module
        Update Position Name
    EXCEPT    Error
        Fatal Error
    END

[EPM_POSITION_NAME_REGRESSION_ST_004]
    [Tags]    EPM_POSITION_NAME_REGRESSION_ST_004
    TRY
        Open Browser and Login
        Redirect to Position Name Module
        Remove Position Name
    EXCEPT    Error
        Fatal Error
    END