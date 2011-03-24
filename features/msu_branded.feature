Feature: MSU Branded Application

  So that my application is clearly an MSU app
  As an application user
  The default layout for the application should conform to the MSU Web Template
  
  Scenario Outline: Viewing a public page
    Given I am not authenticated
    When I go to the user <type> page
    Then the response should contain "<!--Web Template3_widev1.01-->"

    Examples:
      | type         |  
      | registration |
      | log in       |
    
  Scenario Outline: Viewing a private page
    Given I am an authenticated <role> user
    When I go to the jobs page
    Then the response should contain "<!--Web Template3_0v1.01-->"
    
    Examples:
      | role      |
      | admin     |
      | non-admin |