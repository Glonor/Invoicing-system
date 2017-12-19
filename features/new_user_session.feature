Feature: new user session
  As a user
  I want to login

  Scenario: user fills in valid data
    Given I have a user
    When I go to the login page
    And I fill in the user form
    And I click on "Sign in"
    Then I should be on my profile page
    And I log out manually

  Scenario: user fills in bogus data - server side validation
    When I go to the login page
    And I fill in invalid password
    Then I should have a invalid combination error

  Scenario: user tries to access page without login
    When I go to the client index page
    Then I should see a flash message indicating "Please log in."