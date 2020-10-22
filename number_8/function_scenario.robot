*** Settings ***
Library     Collections
Library     function.py

*** Keywords ***
Two arrays and use function then will get expected result
    ${list1} =	            Create List	        1   2   3   4   5
    ${list2} =	            Create List	        1   3   5   7   9
    ${expectedList} =	    Create List	        1   3   5
    
    ${listDuplicates} =     Filter Duplicates   ${list1}     ${list2}
    Sort List               ${listDuplicates}
    Lists Should Be Equal	${listDuplicates}	${expectedList}

*** Test Cases ***

Function test
    Given Two arrays and use function then will get expected result