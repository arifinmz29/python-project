*** Settings ***
Library     RequestsLibrary
Library     Collections

*** Variables ***
${base_url}     https://reqres.in
${uid}      2
${name}     Janet
${job}      Leader

*** Test Cases ***
Get User Info
    ${response}    GET     ${base_url}/api/users/${uid}
    Should Be Equal As Strings    200    ${response.status_code}
    Should Be Equal As Strings    ${uid}    ${response.json()}[data][id]
    Should Be Equal As Strings    ${name}    ${response.json()}[data][first_name]

Post User
    ${body}     Create Dictionary  name=${name}   job=${job}
    ${response}    POST   url=${base_url}/api/users    json=${body}
    Should Be Equal As Strings    201    ${response.status_code}
    Should Be Equal As Strings    ${name}    ${response.json()}[name]
    Should Not Be Empty    ${response.json()}[id]

