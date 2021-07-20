*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variable ***
${base_url}    https://reqres.in/
${page}    2
*** Test Cases ***
responce
    create session    myresponce    ${base_url}
    ${result}=    get request     myresponce    api/users?page=${page}
    log to console    ${result.status_code}
    log to console    ${result.content}
    log to console    ${result.headers}
#VALIDATION
    ${status_code}=    convert to string    ${result.status_code}
    should be equal    ${status_code}    200
#i want to check from content that something is present or not
    ${responce_capture}=    convert to string    ${result.content}
#it will give you in json formate thatswhy i convert into string formate
    should contain    ${responce_capture}    Rachel
    ${Header value}=    get from dictionary    ${result.headers}    Content-Type
    should be equal    ${Header value}    application/json; charset=utf-8

