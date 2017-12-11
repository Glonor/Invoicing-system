Feature: bill the unbilled hours to a specific client with an invoice

  Background:
    Given I have a user
    When I go to the login page
    And I fill in the user form
    And I click on "Sign in"
    Then I should be on my profile page

  Scenario: bill hours
    Given I have a client
    Given I have an event
    And I go to the client profile page
    When I click on "Bill"
    And an invoice is created to the client
    Then I should see the list of the client's billing total
