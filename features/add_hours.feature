Feature: adding hours to the client

 Scenario: adding hours
   Given I am signed in
   And I go to the client profile page
   When I select a range of cells in the calendar
   Then an event is created
