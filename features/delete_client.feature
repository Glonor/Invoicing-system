Feature: delete client
  As a user
  I want to be able to delete clients

  Background:
    Given I have a user
    When I go to the login page
    And I fill in the user form
    And I click on "Sign in"
    Then I should be on my profile page

  Scenario: deleting a client
    Given I have a client
    And I go to the client profile page
    When I click on "Delete"
    Then I should see a flash message indicating "Client was successfully deleted."
