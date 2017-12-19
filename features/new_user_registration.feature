Feature: new user registration
  As a user
  I want to create a new account

  Scenario: user fills in valid data
    When I go to the new user registration page
    And I fill in the new user form
    And I click on "Sign up"
    Then I should be on my profile page

  Scenario: user fills in bogus data - server side validation
    When I go to the new user registration page
    And I fill in the new user form with wrong fiscal code
    And I click on "Sign up"
    Then I should have a fiscal code validation error