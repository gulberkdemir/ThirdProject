*** Settings ***
Library  SeleniumLibrary
Library    ../Variables/SmokeKeywords.py
Library    Collections
Library    RequestsLibrary
Library    String

Resource   ../Variables/CommonVariables.robot
*** Variables ***
${BASE_URL}    https://www.facebook.com/trivagoUS/
*** Keywords ***
Begin Web Test
    Open Browser  ${URL}  ${BROWSER}
    Maximize Browser Window
    Accept Cookie
    # Maximize Browser Window

Accept Cookie
    wait until element is visible    ${OkCookieBtn}    timeout=5
    click element    ${OkCookieBtn}

End Web Test
    Close Browser

User sees the search button in homepage
    wait until element is visible    ${SearchBtn}    timeout=5

user clicks on search button in homepage
    click element    ${SearchBtn}

user enters any place name on expanded search area
    wait until element is visible   ${ExpndedSearchInputArea}    timeout=5
    custom input text and click enter    ${placeName}



search result information is given if results found or not
    wait until element is visible   ${Results}
    ${IsElementVisible}=  Run Keyword And Return Status    Element Should Be Visible   ${Results}
    Run Keyword If    ${IsElementVisible}  log to console  RESULTS FOUND   ELSE  log to console    RESULTS NOT FOUND



the user scrolls down in the home page until end of the page
    Scroll Down Please


user clicks on the contact button
    Click element    ${ContractLink}

user types something on message area
    Select Window    NEW
    wait until element is visible     ${MessageInput}    timeout=10
    input text    ${MessageInput}    TEST

user types it's own name to message area
    input text    ${ContactNameInput}    gulberk demir

user types it's own email to message area
    input text    ${ContactMailInput}     glbrk08@gmail.com


user selects submit checkbox box
    sleep    3seconds
    click element    ${ContractSubmitCheckbox}

user clicks on submit button
    click element    ${ContractSubmitButton}

message should be sent
    wait until element is visible    ${ContractSuccessMessage}    timeout=10
    ${text} =    get text    ${ContractSuccessMessage}
    should be equal    ${text}    Message Sent Successfully!


user types it's own mail to subscribe mail input area
    wait until element is visible    ${SubscribeMailInput}
    input text  ${SubscribeMailInput}  klglggsaasdfsf@gmail.com

user clicks on inspire me button
    click element    ${InsipreMeBtn}

subscribe message should be seen
    wait until element is visible   ${SubscribeMessageArea}
    ${text} =    get text    ${SubscribeMessageArea}
    should be equal    ${text}    You are now checked-in!

the user clicks on the menu on the top left
    wait until element is visible    ${TopLeftMenu}
    click element    ${TopLeftMenu}


user selects the destination
    click element    ${Destination}


user selects the nothwest destination
    mouse over   ${NothWestDestination}
    click element    ${NothWestDestination}

user reaches the nothwest destination page
    wait until element is visible    ${NothWestPageHeader}    timeout=15
    ${text} =    get text    ${NothWestPageHeader}
    should be equal    ${text}    Northwest

the user is the home page
    go to    https://magazine.trivago.com/

the user clicks on each link on the footer
    Find request result for link group    css= #footer-main > div.container-wide > div:nth-child(3) > div > div > a
    Find request result for link group    css= #footer-main > div.container-wide > div:nth-child(2) > div>a



Find request result for link group
    [Arguments]    ${element_group}

    ${element_list}=     get webelements     ${element_group}
    ${href_list}=  Evaluate  [item.get_attribute('href') for item in $element_list]

    Log    ${href_list}

    ${length} =    get length    ${href_list}





    FOR    ${j}   IN RANGE  0  ${length}
         ${asd} =    Get Substring	${href_list[${j}]}    -1

        ${newhref} =    Run Keyword If  '${asd}' == '/'   Get Substring    ${href_list[${j}]}    0    -1
        ...             ELSE                              Get Line    ${href_list[${j}]}    0
        set global variable     ${newhref}


        #${newhref}=    Get Substring    ${href_list[${j}]}    0    -1
        Create Session    sessionName   ${newhref}   verify=True


        ${resp}=  Get Request  sessionName    /
        #${resp2}=    Get Substring    ${resp}   0    -1
        Log    ${resp}
        run keyword and ignore error    Should Be Equal As Strings  ${resp.status_code}  200

    END








