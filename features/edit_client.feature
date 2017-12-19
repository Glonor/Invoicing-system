Feature: editing client profile
  As a user
  I want to edit clients

  Background:
    Given I have a user
    Given I have a client
    When I go to the login page
    And I fill in the user form
    And I click on "Sign in"
    Then I should be on my profile page

  Scenario: editing client profile fields
    And I go to the edit client profile page
    When I fill in valid client data
    And I click on "Save changes"
    Then I should be on client profile page
    And I should see a flash message indicating "Client was successfully updated."

  Scenario: editing client profile fields with wrong data
    Given I go to the edit client profile page
    When I fill in invalid client fiscal code
    And I click on "Save changes"
    Then I should have a "is the wrong length" validation error

  Scenario: editing client profile fields with empty data
    Given I go to the edit client profile page
    When I fill in empty client fiscal code
    And I click on "Save changes"
    Then I should have a "can't be blank" validation error