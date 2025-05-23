*** Settings ***
Library    SeleniumLibrary

Resource    ../resource/EPM-Resource.robot

Resource    ../suite-config-teardown/SuiteConfigTeardown.robot
Resource    ../pages/ProgramCoursePage.robot

Suite Setup       Open Browser and Login
Suite Teardown    Close Browser Interaction


*** Test Cases ***
[EPM_REGRESSION_PROGRAM_COURSE_MODULE_001]
    [Tags]     EPM_REGRESSION_PROGRAM_COURSE_MODULE_001 
    TRY
        Redirect to Program Course Module
    EXCEPT    Error
        Fatal Error
    END

[EPM_REGRESSION_PROGRAM_COURSE_MODULE_002]
    [Tags]     EPM_REGRESSION_PROGRAM_COURSE_MODULE_002
    TRY
        Redirect to Program Course Module
        FOR    ${i}    IN RANGE    3
            Add Program Course
        END
    EXCEPT    Error
        Fatal Error
    END

[EPM_REGRESSION_PROGRAM_COURSE_MODULE_003]
    [Tags]     EPM_REGRESSION_PROGRAM_COURSE_MODULE_003
    TRY
        Redirect to Program Course Module
        Update Program Course
    EXCEPT    Error
        Fatal Error
    END

[EPM_REGRESSION_PROGRAM_COURSE_MODULE_004]
    [Tags]     EPM_REGRESSION_PROGRAM_COURSE_MODULE_004
    TRY
        Redirect to Program Course Module
        Remove Program Course
    EXCEPT    Error
        Fatal Error
    END