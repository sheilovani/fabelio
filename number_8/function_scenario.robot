*** Settings ***
Library     Collections
Library     function.py

*** Keywords ***
Two arrays
    Append To List        ${intA}        [1,2,3,4,5]
    Append To List        ${intB}        [1,3,5,7,9]
    ${result} =  filter_duplicates     ${intA}     ${intB}
    Lists Should Be Equal ${result} [1,3]

Use function filter_duplicates
    filter_duplicates

Output should be [1, 3]
    ${result}         =  filter_duplicates ${intA} ${intB}

*** Test Cases ***
Function test
    Given Two arrays
    # When Use function filter_duplicates
    # Then Output should be [1, 3]