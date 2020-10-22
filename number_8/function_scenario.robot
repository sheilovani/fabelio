*** Keywords ***
Two arrays of int A = [1, 2, 3, 4, 5] and int B = [1, 3, 5, 7, 9]

Use function filter_duplicates

Output should be [1, 3]


*** Test Cases ***
Function test
    Given Two arrays of int A = [1, 2, 3, 4, 5] and int B = [1, 3, 5, 7, 9]
    When Use function filter_duplicates
    Then Output should be [1, 3]