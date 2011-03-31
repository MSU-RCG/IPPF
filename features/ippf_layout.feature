Feature: MSU Branded Application

  So that my application is differentiable 
  As an application user
  The default layout for the application should be IPPF customized
  
  Scenario: Viewing a public page
    Given I am not authenticated
    When I go to the user log in page
    Then I should see "IPPF" within "h1"
    And I should see "IPPF" within "#crumbnav"
    And I should see "Sign In" within "#crumbnav"
    
