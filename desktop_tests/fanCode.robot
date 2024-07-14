*** Settings ***
Resource     ../resources/main.robot

*** Variables ***

*** Test Cases ***
fanCode_verify50%TodoTaskIsCompleted
    [Setup]   Basic Selenium Test Setup
    Comment   --- Step 1 : User belongs to Fancode city---
    User belongs to the city FanCode
    Comment   --- Step 2 : User has the todo tasks ---
    User has the todo tasks      ${FANCODE_CITY}
    Comment   --- Step 3 : User Completed task percentage should be greater than 50%---
    FOR   ${i}    IN RANGE    len(${FANCODE_CITY})
        User Completed task percentage should be greater than 50%       ${FANCODE_CITY[${i}]}[0]     ${JSON_get_todo}
    END





