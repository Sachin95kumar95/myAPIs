*** Settings ***
Library    JSONLibrary
Library    os
Library    Collections

*** Test Cases ***
testcase1
    ${json_object}=    load json from file    json1.json
    ${value}=    get value from json    ${json_object}    $.firstName
#the variable ${value} contain values of firstname in the form of list.
    log to console    ${value[0]}
    should be equal    ${value[0]}    John
#hence the value is in list ,so to extract value from list you have to mention index value
    ${strt_value}=    get value from json    ${json_object}    $.address.streetAddress
    log to console    ${strt_value}
    should be equal    ${strt_value[0]}    naist street

