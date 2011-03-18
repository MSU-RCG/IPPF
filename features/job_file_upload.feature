Feature: Upload files to the compute server
  
  So that the job files can be processed
  As an administrator
  I want the files to be copied to the compute server

  Scenario: Send new job files to the compute server
    When a new job is created
    Then the files are stored locally
    And a background job will copy the files to the compute server
    And the target directory should be "username-jobtype-jobname-date"