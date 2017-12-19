Feature: editing client profile
  As a user
  I want to edit clients

  Background:
    Given I have a user
    When I go to the login page
    And I fill in the user form
    And I click on "Sign in"
    Then I should be on my profile page

  Scenario: deleting a invoice
    Given I have a client
    Given I have a invoice
    And I go to the invoice page
    When I click on "Delete"
    Then I should see a flash message indicating "Invoice was successfully destroyed."
