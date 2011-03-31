Feature: User Management
  
  So that I can add/edit/delete users
  As an administrator
  I want a user management interface

  @wip
  Scenario: Viewing the User Management Interface
    Given I am an authenticated admin user
    When I go to the users page
    Then I should see the users list
    And links to create, edit and delete users

  @wip
  Scenario: Creating a new user
    Given I am an authenticated admin user
    When I go to the new user page
    Then I should see the new user form
    And I create the "Example User"
    Then I should see "Example User created."
    And I should be at the users page
  
  Scenario: Editing an existing user
    Given I am an authenticated admin user
    And "Example User" is an existing user
    When I go to the edit page for "Example User"
    Then I should see the edit user form
    And I update "Example User" with new values
    Then I should see "Example User updated."
    And I should be at the users page
  
  Scenario: Deleting an existing user
    Given I am an authenticated admin user
    And "Example User" is an existing user with 5 submitted jobs
    When I go to the users page
    And I click the delete link for the "Example User"
    Then I should see a confirmation dialogue
    And I press "ok"
    Then the "Example User" will be deleted
    And jobs created by "Example User" will be deleted
    