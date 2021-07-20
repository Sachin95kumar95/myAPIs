*** Settings ***
Library    JSONLibrary
Library    os
Library    Collections
Library    RequestsLibrary

*** Variable ***
${base_url}    https://restcountries.eu

*** Test Cases ***
Get_country_info
    create session    mysession    ${base_url}
    ${responce}=    get request    mysession    /rest/v2/alpha/IN
    ${json_object}=    to json    ${responce.content}
#single data validation
    ${country_name}=    get value from json    ${json_object}    $.name
    log to console    ${country_name[0]}
    should be equal    ${country_name[0]}    India

#single data validation in array
    ${boarder}=    get value from json    ${json_object}    $.borders[0]
    log to console    ${boarder[0]}
    should be equal    ${boarder[0]}    AFG

#multiple data validation in array
    ${boarder}=    get value from json    ${json_object}    $.borders[0]
    log to console    ${boarder[0]}
    should contain any    ${boarder[0]}    AFG    BGD    BTN    MMR
    should not contain any    asd    gdhg    ytg


