*** Settings ***
Documentation     Resource file containing keywords to meet the preconditions for test cases.
Library      RequestsLibrary
Library      JSONLibrary
Library      String
Library      Collections
Resource     poms/user.robot
Resource     poms/todo.robot

*** Variables ***
${Base_URL}    https://jsonplaceholder.typicode.com/

*** Keywords ***
Basic Selenium Test Setup
    Create Session     API_TEST     ${Base_URL}