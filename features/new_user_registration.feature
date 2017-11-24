Feature: new user registration

  Background:
    When I go to the new user registration page
    And I fill in the new user form
    And I submit the form
    Then I should be on the home page

  Scenario: user fills in bogus data - server side validation
    When I log out manually
    And I go to the new user registration page
    And I fill in with empty first_name
    And I press "sign up"
    Then I should not be able to sign up
    And I should have a validation error on "user_first_name"

    When I fill in with empty last_name
    And I press "sign up"
    Then I should not be able to sign up
    And I should have a validation error on "user_last_name"

    When I fill in invalid email
    And I press "sign up"
    Then I should not be able to sign up
    And I should have a validation error on "user_email"

    When I fill in invalid password
    And I press "sign up"
    Then I should not be able to sign up
    And I should have a validation error on "user_password, user_password_confirmation"

  Scenario: User fills in an already registred email
    When I log out manually
    And I go to the new user registration page
    And I fill in the new user form with an existing email
    And I submit the form
    Then I should not be able to sign up
    And I should have a validation error on "user_email"
