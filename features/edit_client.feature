Feature: editing client profile
  Background:
    Given I have a user
    When I go to the login page
    And I fill in the user form
    And I click on "Sign in"
    Then I should be on my profile page

  Scenario: editing client profile fields
    Given I have a client
    And I go to the edit client profile page
    When I fill in valid client data
    And I click on "Saves Changes"
    Then I should be on client profile page
    And I should see a flash message indicating success
