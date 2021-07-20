*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variable ***
${base_url}    https://reqres.in/

*** Test Cases ***
post request practice
    create session    mysession    ${base_url}
    ${body}=    create dictionary   name=morpheus   job=leader
    ${header}=    create dictionary    Content-Type=application/json
    ${responce}=    post request    mysession    api/users    data=${body}    headers=${header}

    log to console    ${responce.status_code}
    log to console    ${responce.content}

    #validation
    ${status_code}=    convert to string    ${responce.status_code}
    should be equal    ${status_code}    201

    ${res_body}=    convert to string    ${responce.content}
#this content in the form of JSON formate thats why we conver here

    should contain    ${res_body}    morpheus
    should contain    ${res_body}    leader






