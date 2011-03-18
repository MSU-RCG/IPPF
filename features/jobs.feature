Feature: Jobs Interface
  
  So that I can manage and submit jobs to be processed
  As an application user or admin
  I want to have access to a jobs interface

  Scenario: The Jobs interface requires logged in user
    Given I am not authenticated
    When I go to the home page
    Then I am redirected to the user registration page
  
  Scenario: The Jobs interface should be the home page
    Given I am an authenticated non-admin user
    When I go to the home page
    Then I should be at the jobs page
  
  Scenario: Viewing Jobs as a non-admin
    Given I am an authenticated non-admin user
    When I go to the jobs page
    Then I should see a list of my submitted jobs
    And jobs will be sorted by status
    And I should see a button to submit a new job
  
  Scenario: Creating a new Job
    Given I am an authenticated non-admin user
    When I go to the new job page
    And I create "My New Job"
    Then "My New Job" should be added to the jobs list with a status of "in progress"
    And "My New Job" should have a job type of "shape" or "transect"
    And "My New Job" should have one or more files
    And "My New Job" should have coordinates
    And an email will be sent to the job creator
    And an email will be sent to the admin
  
  Scenario: Creating a Shape File Job
    Given I am an authenticated non-admin user
    When I go to the new job page
    And I create "My Shape File Job"
    Then "My Shape File Job" should have a job type of "shape"
    And "My Shape File Job" should have two or more files
    And "My Shape File Job" should have a "survey area shape file"
  
  Scenario: Creating a Transect File Job
    Given I am an authenticated non-admin user
    When I go to the new job page
    And I create "My Transect File Job"
    Then "My Transect File Job" should have a job type of "transect"
    And "My Transect File Job" should have one or more files

  Scenario: Creating a new Job with invalid or missing data
    Given I am an authenticated non-admin user
    And I create an "Invalid Job"
    Then I should see an error message
    And the "Invalid Job" should not be added to the Job list
    And I should be at the new job page

  Scenario: Viewing Jobs as an admin
    Given I am an authenticated admin user
    Then I should see a list of all submitted jobs
    And I should see a link to view job details for each job
    And I should be able to mark jobs as completed
    And completed jobs will be hidden by default
    And I should see a link to show all jobs
  
  Scenario: Marking a job as completed
    Given I am an authenticated admin user
    When I press the Completed button for the "Example Job"
    Then I should see a confirmation request
    And I press "ok"
    Then the "Example Job" will have a status of "completed"
    And an email will be sent to the job creator
    And an email will be sent to the admin
  
  Scenario: Able to submit jobs like a non-admin user
    Given I am an authenticated admin user
    When I go to the jobs page
    Then I should see a button to submit a new job
  

    
  
  