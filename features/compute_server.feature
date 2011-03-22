Feature: Send/Retrieve files to/from the compute server
  
  So that the job files can be completed
  As an administrator
  I want the files to be processed on the compute server

  Scenario: Send new job files to the compute server
    When a new job is created
    Then the files are stored locally
    And a background job will copy the files to the compute server
    And the target directory should be "username-jobtype-jobname-date"
  
  Scenario: Check for completed job files on the compute server
    Given an "Example Job" is pending
    When the job is being processed
    Then a background worker will check periodically for the completed files in a "completed" subdirectory

  Scenario: Download completed job files from the compute server
    Given an "Example Job" is pending
    And the computation on the job is complete
    Then a background worker will download the file to the server
    And the "Example Job" will be updated with a "completed" status
    And an email will be sent to the job creator
    And an email will be sent to the admin