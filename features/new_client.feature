Feature: new client

  Background:
    When I go to the clients page
    And I press "Add client"
    Then I'm redirected to the new client page
    And I fill in the new client form
    And I submit the form
    Then I should be on the clients page

 Scenario: user fills in bogus data - server side validation
    When I go to the new client page
    And I fill in with empty first_name
    And I press "create client"
    Then I should not be able to create a client
    And I should have a validation error on "client_first_name"

    When I fill in with empty last_name
    And I press "create client"
    Then I should not be able to create a client
    And I should have a validation error on "client_last_name"

    When I fill in invalid email
    And I press "create client"
    Then I should not be able to create a client
    And I should have a validation error on "client_email"

    When I fill in invalid tariff
    And I press "create client"
    Then I should not be able to create a client
    And I should have a validation error on "client_tariff"
