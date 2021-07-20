*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variable ***
${base_url}    https://maps.googleapis.com
${req_uri}    /maps/api/place/nearbysearch/xml?

*** Test Cases ***
google_map_palce_api
    create session    mysession    ${base_url}
    ${params}    create dictionary    location=-33.8670522,151.1957362    radius=500    types=food    name=harbour    key=AIzaSyAmzQx2jnpe4S6f2JjuElEjLHM4CunuoBU
    ${responce}=    get request    mysession    ${req_uri}    params=${params}

    log to console    ${responce.status_code}
    log to console    ${responce.content}
