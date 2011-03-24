Feature: User Authentication

  So that I can use the application
  As a prospective user
  I want to be able to log in

  Scenario Outline: Creating a new account
    Given I am not authenticated
    When I go to the new user registration page
    And I fill in "user_email" with "<email>"
    And I fill in "user_password" with "<password>"
    And I fill in "user_password_confirmation" with "<password>"
    And I press "Sign up"
    Then I should see "logged in as <email>" 

    Examples:
      | email           | password   |
      | testing@man.net | secretpass |
      | foo@bar.com     | fr33z3     |
  
  Scenario: Logging in 
    Given I am not authenticated
    And "Example User" is an existing user
    When I go to the user login page
    And I fill in "user_email" with "example@example.com"
    And I fill in "user_password" with "secretpass"
    And I fill in "user_password_confirmation" with "secretpass"
    And I press "Log In"
    Then I should see "logged in as example@example.com" 

  Scenario: Able to edit my account
    Given I am a new, authenticated user 
    When I go to the edit user registration page
    Then I should see my account information form
    And I should not see my role
    And I update my account information
    Then I should see "Your account has been updated."
    And I should be at the home page

