*** Settings ***
Library    RequestsLibrary


*** Variable ***
${base_url}    https://reqres.in/

*** Test Cases ***
delete request
    create session    mysession    ${base_url}
    ${responce}=    DELETE request    mysession    api/users/2
    log to console    ${responce.status_code}

    #validation
    ${status_code}=    convert to string    ${responce.status_code}
    should be equal    ${status_code}    204
