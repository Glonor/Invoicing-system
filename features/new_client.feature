Feature: new client
  As a user
  I want to add new clients

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
    And I fill in valid new client data
    And I click on "Create client"
    Then I should be on client profile page

  Scenario: user fills in bogus data - server side validation
    When I go to the clients page
    And I click on new client icon
    And I am redirected to the new client page
    And I fill in invalid new client fiscal code
    And I click on "Create client"
    Then I should have a "is the wrong length" validation error

  Scenario: user fills in empty data
    When I go to the clients page
    And I click on new client icon
    And I am redirected to the new client page
    And I fill in empty new client fiscal code
    And I click on "Create client"
    Then I should have a "can't be blank" validation error