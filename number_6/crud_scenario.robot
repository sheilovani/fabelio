*** Settings ***
Library     RequestsLibrary
Library     Collections
Library     JSONLibrary


*** Variables ***
${base_url}              http://httpbin.org
${post_endpoint}         /post
${get_endpoint}          /get
${put_endpoint}          /put
${delete_endpoint}       /delete

*** Keywords ***
Base URL
    Create Session    my_session    ${base_url}     verify=true

Set Post Method and Will Get Response 200
    ${headers}        Create Dictionary      Content-Type=application/json
    ${response}=      Post Request    my_session    ${post_endpoint}    headers=${headers}
    Should Be Equal As Strings        ${response.status_code}     200

Set Get Method and Will Get Response 200
    ${headers}        Create Dictionary      Content-Type=application/json
    ${response}=      Get Request    my_session    ${get_endpoint}    headers=${headers}
    Should Be Equal As Strings        ${response.status_code}     200

Set Put Method and Will Get Response 200
    ${headers}        Create Dictionary      Content-Type=application/json
    ${response}=      Put Request    my_session    ${put_endpoint}    headers=${headers}
    Should Be Equal As Strings        ${response.status_code}     200

Set Delete Method and Will Get Response 200
    ${headers}        Create Dictionary      Content-Type=application/json
    ${response}=      Delete Request    my_session    ${delete_endpoint}    headers=${headers}
    Should Be Equal As Strings        ${response.status_code}     200


*** Test Cases ***
API Test with POST method and success OK
    Given Base URL
    Then Set Post Method and Will Get Response 200

API Test with GET method and success OK
    Given Base URL
    Then Set Get Method and Will Get Response 200

API Test with UPDATE method and success OK
    Given Base URL
    Then Set Put Method and Will Get Response 200

API Test with DELETE method and success OK
    Given Base URL
    Then Set Delete Method and Will Get Response 200