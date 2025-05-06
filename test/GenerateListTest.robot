*** Settings ***
Library    SeleniumLibrary

Resource    ../resource/EPM-Resource.robot
Resource    ../suite-config-teardown/SuiteConfigTeardown.robot
Resource    ../pages/GenerateListPage.robot


Test Teardown    Close Browser Interaction


*** Test Cases ***


[EPM_REGRESSION_GENERATE_LIST_001]
    [Tags]     EPM_REGRESSION_GENERATE_LIST_001
    TRY
        Open Browser and Login
        Redirect to Generate List Module
    EXCEPT    Error
        Fatal Error
    END

[EPM_REGRESSION_GENERATE_LIST_002]
    [Tags]     EPM_REGRESSION_GENERATE_LIST_002
    TRY
        Open Browser and Login
        Redirect to Generate List Module
        For Payroll Generation
    EXCEPT    Error
        Fatal Error
    END

[EPM_REGRESSION_GENERATE_LIST_003]
    [Tags]     EPM_REGRESSION_GENERATE_LIST_003
    TRY
        Open Browser and Login
        Redirect to Generate List Module
        Filtering Values
    EXCEPT    Error
        Fatal Error
    END