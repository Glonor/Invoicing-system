Feature: new client

  Background:
    Given I have a user
    When I go to the login page
    And I fill in the user form
    And I click on "Sign in"
    Then I should be on my profile page

  Scenario: create new client
    When I go to the clients page
    And I click on new client icon
    And I am redirected to the new client page
    And I fill in the new client form
    And I click on "Create client"
    Then I should be on client profile page

  Scenario: user fills in bogus data - server side validation
    When I go to the clients page
    And I click on new client icon
    And I am redirected to the new client page
    And I fill in with empty first_name
    And I click on "Create client"
    Then I should have a validation error