Feature: editing your profile

  Background:
    Given I have a user
    When I go to the login page
    And I fill in the user form
    And I click on "Sign in"
    Then I should be on my profile page

  Scenario: editing profile fields
    Given I go to the edit profile page
    When I fill in valid user data
    And I click on "Save changes"
    Then I should be on my profile page
    And I should see a flash message indicating success updating