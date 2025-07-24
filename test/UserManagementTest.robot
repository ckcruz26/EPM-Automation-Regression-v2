*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Library      FakerLibrary

Resource    ../pages/UserManagementPage.robot
Resource    ../resource/EPM-Resource.robot
Resource    ../suite-config-teardown/SuiteConfigTeardown.robot

Suite Setup       Open Browser and Login
Suite Teardown    Close Browser Interaction


*** Test Cases ***
[EPM_REGRESSION_USER_ST_001]
    [Tags]     EPM_REGRESSION_USER_ST_001
    TRY
        Go to User Management Page
    EXCEPT    Error
        Fatal Error
    END

[EPM_REGRESSION_USER_ST_002]
    [Tags]     EPM_REGRESSION_USER_ST_002
    TRY
        Go to User Management Page
        Download Employees Without Item No.
    EXCEPT    Error
        Fatal Error
    END

[EPM_REGRESSION_USER_ST_003]
    [Tags]     EPM_REGRESSION_USER_ST_003
    TRY
        Go to User Management Page
        Download Employees With Item No.
    EXCEPT    Error
        Fatal Error
    END

[EPM_REGRESSION_USER_ST_004]
    [Tags]     EPM_REGRESSION_USER_ST_004
    TRY
        Go to User Management Page
        Add New User
    EXCEPT    Error
        Fatal Error
    END

[EPM_REGRESSION_USER_ST_005]
    [Tags]     EPM_REGRESSION_USER_ST_005
    TRY
        Go to User Management Page
        Update User in Personal Information
    EXCEPT    Error
        Fatal Error
    END

[EPM_REGRESSION_USER_ST_006]
    [Tags]     EPM_REGRESSION_USER_ST_006
    TRY
        Go to User Management Page
        Update User in Item Code
    EXCEPT    Error
        Fatal Error
    END

[EPM_REGRESSION_USER_ST_007]
    [Tags]     EPM_REGRESSION_USER_ST_007
    TRY
        Go to User Management Page
        Update User in Item Code Job Vacated
    EXCEPT    Error
        Fatal Error
    END

[EPM_REGRESSION_USER_ST_008]
    [Tags]     EPM_REGRESSION_USER_ST_008
    TRY
        Go to User Management Page
        Lock Specific User Account
    EXCEPT    Error
        Fatal Error
    END

[EPM_REGRESSION_USER_ST_009]
    [Tags]     EPM_REGRESSION_USER_ST_009
    TRY
        Go to User Management Page
        Unlock Specific User Account
    EXCEPT    Error
        Fatal Error
    END

[EPM_REGRESSION_USER_ST_010]
    [Tags]     EPM_REGRESSION_USER_ST_010
    TRY
        Go to User Management Page
        Reset Password Specific User Account
    EXCEPT    Error
        Fatal Error
    END

#  on hold script
# [EPM_REGRESSION_USER_ST_011]
#     [Tags]     EPM_REGRESSION_USER_ST_011
#     TRY
#         Go to User Management Page
#         Set The User Account To Inactive
#     EXCEPT    Error
#         Fatal Error
#     END

[EPM_REGRESSION_USER_ST_012]
    [Tags]     EPM_REGRESSION_USER_ST_012
    TRY
        Go to User Management Page
        Re-engage User Account
    EXCEPT    Error
        Fatal Error
    END