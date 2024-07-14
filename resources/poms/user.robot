*** Settings ***
Documentation   This page covers all the keywords related to the users api

*** Variables ***

*** Keywords ***
User belongs to the city FanCode
    [Documentation]    This Keywords checks if the user belongs to the Fancode city
    ...         Within    -40  &   5  Latitude
    ...         &          5   &   100    Longitude
    ${get_user}     Get On Session     API_TEST     users
    ${JSON_get_user}   To Json        ${get_user.content}
    ${value}    Get Value From Json    ${JSON_get_user}     $..id
    ${LEN}   Set Variable    ${value[-1]}
    Comment   --- Step 1 : User belongs to city FanCode---
    ${FANCODE_CITY}    Create List
    FOR    ${i}   IN RANGE    0    ${LEN}
        ${id_value}   Get Value From Json    ${JSON_get_user[${i}]}    $..id
        ${Lat_value}   Get Value From Json    ${JSON_get_user[${i}]}     $..lat
        ${Lat_value}   Get Value From Json    ${JSON_get_user[${i}]}     $..lng
        ${is_within_range_lat}    Set Variable If    -40 < ${Lat_value[0]} < 5    True    False
        ${is_within_range_lng}    Set Variable If    5 < ${Lat_value[0]} < 100    True    False
        Run Keyword If     "${is_within_range_lat}" and "${is_within_range_lng}" =="True"    Append To List    ${FANCODE_CITY}    ${id_value}
    END
    Set Test Variable   ${FANCODE_CITY}