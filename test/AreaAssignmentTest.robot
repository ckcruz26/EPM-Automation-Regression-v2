*** Settings ***
Library    SeleniumLibrary

Resource    ../resource/EPM-Resource.robot
Resource    ../suite-config-teardown/SuiteConfigTeardown.robot
Resource    ../pages/AreaAssignmentPage.robot

Suite Setup       Open Browser and Login
Suite Teardown    Close Browser Interaction

*** Test Cases ***

[EPM_REGRESSION_AREA_OF_ASSIGNMENT_ST_001]
    [Tags]    EPM_REGRESSION_AREA_OF_ASSIGNMENT_ST_001
    TRY
        Redirect to Add Area of Assignment Module
    EXCEPT    Error
        Fatal Error
    END

[EPM_REGRESSION_AREA_OF_ASSIGNMENT_ST_002]
    [Tags]    EPM_REGRESSION_AREA_OF_ASSIGNMENT_ST_002
    Redirect to Add Area of Assignment Module
    FOR    ${i}    IN RANGE    3
        TRY
            Add Area of Assignment
        EXCEPT    Error
            Fatal Error
        END
    END

[EPM_REGRESSION_AREA_OF_ASSIGNMENT_ST_003]
    [Tags]    EPM_REGRESSION_AREA_OF_ASSIGNMENT_ST_003
    TRY
        Redirect to Add Area of Assignment Module
        Update Area of Assignment
    EXCEPT    Error
        Fatal Error
    END

[EPM_REGRESSION_AREA_OF_ASSIGNMENT_ST_004]
    [Tags]    EPM_REGRESSION_AREA_OF_ASSIGNMENT_ST_004
    TRY
        Redirect to Add Area of Assignment Module
        Remove Area of Assignment
    EXCEPT    Error
        Fatal Error
    END
