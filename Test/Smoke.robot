*** Variables ***


*** Settings ***
Resource  ../Sources/Pages/Common.robot
Test Setup  Begin Web Test
Test Teardown  End Web Test

*** Test Cases ***
Search for any location on Magazine by using the search bar
    Given User sees the search button in homepage
    And user clicks on search button in homepage
    When user enters any place name on expanded search area
    Then search result information is given if results found or not

Fill in the contact form and send it
    Given the user scrolls down in the home page until end of the page
    And user clicks on the contact button
    And user types something on message area
    And user types it's own name to message area
    And user types it's own email to message area
    And user selects submit checkbox box
    when user clicks on submit button
    then message should be sent


Subscribe to the Newsletter
    Given the user scrolls down in the home page until end of the page
    And user types it's own mail to subscribe mail input area
    When user clicks on inspire me button
    then subscribe message should be seen

Navigate to a destination through the menu on the top left
    Given the user clicks on the menu on the top left
    And user selects the destination
    when user selects the nothwest destination
    then user reaches the nothwest destination page

Verify that the links in homepage are working
    Given the user is the home page
    Then the user clicks on each link on the footer



