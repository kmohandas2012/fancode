*** Settings ***
Documentation   This page covers all the keywords related to the todos api

*** Variables ***

*** Keywords ***
User has the todo tasks
   [Documentation]  This keyword checks if the user from Fancode city has ToDo tasks assigned to them
   ...   ...    *Argument(s):*
    ...    - ${FANCODE_CITY} - All the user within the FanCode City
   [Arguments]    ${FANCODE_CITY}
   ${get_todo}     Get On Session     API_TEST     todos
   ${JSON_get_todo}   To Json        ${get_todo.content}
   Set Test Variable    ${JSON_get_todo}
   ${value}    Get Value From Json    ${JSON_get_todo}     $..id
   ${LEN}   Set Variable    ${value[-1]}
   ${ToDo_users}     Create List
   FOR   ${i}   IN RANGE     ${LEN}
       ${id_value}    Get Value From Json 	    ${JSON_get_todo[${i}]}    $..userId
       Append To List     ${ToDo_users}      ${id_value}
   END
   ${ToDo_users}    Remove Duplicates      ${ToDo_users}
   #All the user from Fancode city has Task
   FOR    ${i}   IN RANGE    len(${FANCODE_CITY})
           Should Contain      ${ToDo_users}    ${FANCODE_CITY[${i}]}
   END

User Completed task percentage should be greater than 50%
    [Documentation]    Checks if each user in FanCode city has completion percentage over 50%
    ...   ...    *Argument(s):*
    ...    - ${UserId} - User id for which you want the task completion status
    ...    - ${JSON_get_todo} - Json object with required data
    [Arguments]    ${UserId}      ${JSON_get_todo}
    ${completed_value} =    create list
    FOR    ${item}    IN    @{JSON_get_todo}
        Run Keyword If    ${item['userId']} == ${UserId}    Append To List    ${completed_value}     ${item['completed']}
    END
    Log    ${completed_value}
    ${count} =    Set Variable     0
    FOR  ${i}   IN RANGE    len(${completed_value})
        ${count}    Run Keyword If     '${completed_value[${i}]}'=='True'    Evaluate    ${count}+1
        ...    ELSE    Evaluate    ${count}+0
    END
    ${Percent}   Evaluate    (${count}/len(${completed_value}))*100
    ${is_within_range}    Set Variable If    ${Percent} > 50    True    False
    Run Keyword And Warn On Failure     Should Be True       ${is_within_range}       User number ${UserId} Has only completed ${Percent}% of their tasks