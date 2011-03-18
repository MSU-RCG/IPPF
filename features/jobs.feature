Feature: Jobs
  
  So that I can submit jobs to be processed
  As an application user
  I want to have access to a jobs interface

  Scenario: The Jobs interface requires logged in user
    Given I am not authenticated
    When I go to the home page
    Then I am redirected to the user registration page
  
  # Scenario: The Jobs interface should be the home page for a logged in user
