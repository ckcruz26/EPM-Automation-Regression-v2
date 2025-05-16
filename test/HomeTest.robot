*** Settings ***
Library    SeleniumLibrary
Resource    ../suite-config-teardown/SuiteConfigTeardown.robot

Suite Setup       Open Browser and Login
Suite Teardown    Close Browser Interaction


*** Test Cases ***
[EPM_REGRESSION_HOME_ST_001]
    [Tags]    EPM_REGRESSION_HOME_ST_001
    TRY
        Go To    https://172.31.32.64/registration/homePage.php
        ${current_url}=    Get Location
        Should Contain    ${current_url}    homePage.php
    EXCEPT    ERROR
        Fatal Error
    END
