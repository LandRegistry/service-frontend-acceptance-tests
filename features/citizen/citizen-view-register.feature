@property-frontend
Feature: Citizen view register

Scenario: view freehold register as citizen
Given I have a registered propertyB
And I am a citizen
When I view the register
Then the address of property is displayed
And Title Number is displayed
And Price Paid is displayed
And No lease information is displayed
And Audit for public citizen search of title written

Scenario: view lease register as citizen without clauses and different lessee
Given I have a registered property with characteristicsB
  | CHARACTERISTICS                               |
  | leasehold                                     |
  | has no lease clauses                          |
  | has a lessee name different to the proprietor |
And I am a citizen
When I view the register
Then the address of property is displayed
And Title Number is displayed
And Price Paid is displayed
And Date of Lease is displayed
And Lease Term is displayed
And Lease Term start date is displayed
And Lessor name is displayed
And Lessee name is displayed
And easements within the lease clause NOT displayed
And alienation clause NOT displayed
And landlords title registered clause NOT displayed
And Audit for public citizen search of title written

Scenario: view lease register as citizen with clauses and lessee as proprietor
Given I have a registered property with characteristicsB
  | CHARACTERISTICS                            |
  | leasehold                                  |
  | has lease clauses                          |
  | has a lessee name matching the proprietor  |
And I am a citizen
When I view the register
Then the address of property is displayed
And Title Number is displayed
And Price Paid is displayed
And Date of Lease is displayed
And Lease Term is displayed
And Lease Term start date is displayed
And Lessor name is displayed
And Lessee name NOT displayed
And easements within the lease clause is displayed
And alienation clause is displayed
And landlords title registered clause is displayed
And Audit for public citizen search of title written

Scenario: try to view register that does not exist
Given I am a citizen
When I try to view a register that does not exist
Then an error will be displayed

Scenario: Public Register with Title Extents
Given I have a registered property with characteristicsB
    | CHARACTERISTICS                   |
    | has a polygon with easement       |
    | has a doughnut polygon            |
And I am a citizen
When I view the register
And I check the title plan (public view)
Then there is 2 polygons
And the whole polygon area is in view
And the polygons matches that of the title
And the polygons are edged in red
And there is a donut polygon
And there is a normal polygon
And there are no easements displayed
And the map can't be zoomed
And the map can't be moved
And the Polygons are laid over a map
