*** Settings ***
Library    SeleniumLibrary
Resource    ../pages/LoginPage.robot
Resource    ../resource/EPM-Resource.robot


*** Test Cases ***
[EPM_REGRESSION_LOGIN_ST_001]
    [Tags]    EPM_REGRESSION_LOGIN_ST_001
    TRY
        Open WebApp using Edge
        LoginForm    ${personnelUN}    ${personnelPW}
        Verify Successful Message
    EXCEPT    Error
        Fatal Error
    FINALLY
        Close Browser
    END

[EPM_REGRESSION_LOGIN_ST_002]
     [Tags]    EPM_REGRESSION_LOGIN_ST_002
    TRY
        Open WebApp using Edge
        LoginForm    ${personnelUN}    21313123
        Verify Error Message
    EXCEPT     Error
        Fatal Error
    FINALLY
        Close Browser
    END
