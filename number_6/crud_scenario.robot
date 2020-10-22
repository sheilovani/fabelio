*** Settings ***
Library     RequestsLibrary
Library     Collections
Library     JSONLibrary


*** Variables ***
${base_url}              http://httpbin.org
${post_endpoint}         /post
${get_endpoint}          /get
${update_endpoint}       /put
${delete_endpoint}       /delete

*** Keywords ***
Base URL
    Create Session    my_session    ${base_url}     verify=true

Set Headers and Post method
    ${headers}=       Create Dictionary      Content-Type=application/json
    ${response}=      Post Request    my_session    ${post_endpoint}    headers=${headers}
    # Should Be Equal As Strings        ${response.status_code}     200

Set Post method
    ${response}=      Post Request    my_session    ${post_endpoint}    headers=${headers}

Set Get method
    ${response}=      Get Request    my_session    ${get_endpoint}    headers=${headers}

Set Update method
    ${response}=      Put Request    my_session    ${update_endpoint}    headers=${headers}

Set Delete method
    ${response}=      Delete Request    my_session    ${delete_endpoint}    headers=${headers}

Response Get Success OK
    ${code}=	Get Value From Json	${response.json()}	$..code
    Should Contain    ${code}     200 OK

*** Test Cases ***
API Test with POST method and success OK
    Given Base URL
    When Set Headers and Post method
    Then Response Get Success OK

# API Test with GET method and success OK
#     Given Base URL
#     When Set Headers
#     And Set Get method
#     Then Response Get Success OK

# API Test with UPDATE method and success OK
#     Given Base URL
#     When Set Headers
#     And Set Update method
#     Then Response Get Success OK

# API Test with DELETE method and success OK
#     Given Base URL
#     When Set Headers
#     And Set Delete method
#     Then Response Get Success OK