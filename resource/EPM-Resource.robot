*** Settings ***

Library    SeleniumLibrary


*** Variables ***
${baseURL}            https://172.31.32.64/registration/
${browserName}        Chrome
${personnelUN}        12456
${personnelPW}        P@ssw0rd

# Profile Radio Button
@{arrRadio}    q1a_no    q1b_no    q2a_no    q2b_no    q3_no    q4_no    q5a_no    q5b_no    q6_no    q7a_no    q7b_no    q7c_no


*** Keywords ***
#General Reuse
Open WebApp using Edge
    Open Browser    ${baseURL}    ${browserName}    
...    options=add_argument("--ignore-certificate-errors")
# --headless
    Maximize Browser Window
    
