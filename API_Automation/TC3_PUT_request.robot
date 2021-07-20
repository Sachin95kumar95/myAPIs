*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variable ***
${base_url}    https://reqres.in/

*** Test Cases ***
put request
    create session    mysession    ${base_url}
    ${body}=    create dictionary   name=sachin   job=zion resident
    ${header}=    create dictionary    Content-Type=application/json
    ${responce}=    put request    mysession    api/users/2    data=${body}    headers=${header}

    log to console    ${responce.status_code}
    log to console    ${responce.content}

    #validation
    ${status_code}=    convert to string    ${responce.status_code}
    should be equal    ${status_code}    200

    ${res_body}=    convert to string    ${responce.content}

    should contain    ${res_body}    sachin
    should contain    ${res_body}    zion resident

