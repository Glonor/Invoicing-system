Feature: adding hours to the client

  Background:
    Given I have a user
    When I go to the login page
    And I fill in the user form
    And I click on "Sign in"
    Then I should be on my profile page

 Scenario: adding hours
   Given I have a client
   And I go to the client profile page
   When I select a range of cells in the calendar
   Then an event is created
