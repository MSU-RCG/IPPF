Feature: MSU Branded Application

  So that my application is clearly an MSU app
  As an application user
  The default layout for the application should conform to the MSU Web Template
  
  Scenario Outline: Viewing a public page
    Given I am not authenticated
    When I go to the new user <type> page
    Then I should see "<!--Web Template3_widev1.01-->"
    Examples:
      | type         |  
      | registration |
      | login        |
    
  Scenario Outline: Viewing a private page
    Given I am an authenticated <role> user
    When I go to the jobs page
    Then I should see "<!--Web Template3_0v1.01-->"
    
    Examples:
      | role      |
      | admin     |
      | non-admin |