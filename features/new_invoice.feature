Feature: bill the unbilled hours to a specific client with an invoice

 Background:
  Given I am signed in
  And I go to the client profile page
  When I press "Bill"
  Then an invoice is created to the client

 Scenario: user view the invoice
   When I go to the client's invoice index page
   And I press to a specific invoice
   Then I should see the list of the client's billing hours and the billing total
