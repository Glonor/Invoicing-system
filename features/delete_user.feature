Feature: delete user
  As an admin
  I want to delete users

  Background:
    Given I have an admin
    When I go to the login page
    And I fill in the admin form
    And I click on "Sign in"
    Then I should be on my profile page

  Scenario: deleting a client
    Given I have a user
    And I go to the user profile page
    When I click on "Delete"
    Then I should see a flash message indicating ""
