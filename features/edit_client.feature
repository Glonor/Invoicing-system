Feature: editing client profile

  Scenario: editing client profile fields
    Given I am signed in
    And I go to the edit client profile page
    When I fill in valid data
    And I press "saves changes"
    Then I should be on client profile page
    And I should see a flash message indicating success
    And I should see updated profile fields
