*** Settings ***
Library    SeleniumLibrary

Resource    ../resource/EPM-Resource.robot

Resource    ../suite-config-teardown/SuiteConfigTeardown.robot
Resource    ../pages/PositionPage.robot



Suite Setup       Open Browser and Login
Suite Teardown    Close Browser Interaction


*** Test Cases ***

[EPM_REGRESSION_POSITION_ST_001]
    [Tags]     EPM_REGRESSION_POSITION_ST_001
    TRY
        Go To Position Page
    EXCEPT    Error
        Fatal Error
    END

[EPM_REGRESSION_POSITION_ST_002]
    [Tags]     EPM_REGRESSION_POSITION_ST_002
    TRY
        Go To Position Page
        Add New Item Position
    EXCEPT    Error
        Fatal Error
    END

[EPM_REGRESSION_POSITION_ST_003]
    [Tags]     EPM_REGRESSION_POSITION_ST_003
    TRY
        Go To Position Page
        Update the Position
    EXCEPT    Error
        Fatal Error
    END

[EPM_REGRESSION_POSITION_ST_004]
    [Tags]     EPM_REGRESSION_POSITION_ST_004
    TRY
        Go To Position Page
        Abolish the Position
    EXCEPT    Error
        Fatal Error
    END