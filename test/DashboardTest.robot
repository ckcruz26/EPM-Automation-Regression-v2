*** Settings ***
Library    SeleniumLibrary

Resource    ../resource/EPM-Resource.robot
Resource    ../pages/DashboardPage.robot
Resource    ../suite-config-teardown/SuiteConfigTeardown.robot


Suite Setup       Open Browser and Login
Suite Teardown    Close Browser Interaction

*** Test Cases ***

[EPM_REGRESSION_DASHBOARD_ST_001]
    [Tags]     EPM_REGRESSION_DASHBOARD_ST_001
    TRY
        Redirect to Dashboard
    EXCEPT    Error
        Fatal Error
    END