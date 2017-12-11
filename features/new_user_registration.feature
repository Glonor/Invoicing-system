Feature: new user registration

  Background:
    When I go to the new user registration page
    And I fill in the new user form
    Then I should be on my profile page

  Scenario: user fills in bogus data - server side validation
    When I log out manually
    And I fill in invalid password
    Then I should have a invalid combination error