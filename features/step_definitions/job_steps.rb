Given /^I have( no)? submitted jobs$/ do |bool|
  if bool
    Given %{I am on the jobs page} 
    And %{I fill in "name" with "Job1"}
    And %{I select "shape" from "job_type"}
    And %{I fill in coordinates with "123 45 67"}
    And %{I press "Submit Job"}
  end
end

Then /^I should see a list of my submitted jobs$/ do
  current_user.jobs.should_not be_empty
  current_user.jobs.each do |job|
    response.should contain(job.name)
  end
end

Then /^jobs will be sorted by status$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should see a button to submit a new job$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should see a list of all submitted jobs$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should see a link to view job details for each job$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should be able to mark jobs as completed$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^completed jobs will be hidden by default$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should see a link to show all jobs$/ do
  pending # express the regexp above with the code you wish you had
end

When /^I create "([^"]*)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then /^"([^"]*)" should be added to the jobs list with a status of "([^"]*)"$/ do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end

Then /^"([^"]*)" should have a job type of "([^"]*)" or "([^"]*)"$/ do |arg1, arg2, arg3|
  pending # express the regexp above with the code you wish you had
end

Then /^"([^"]*)" should have one or more files$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then /^"([^"]*)" should have coordinates$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then /^an email will be sent to the job creator$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^an email will be sent to the admin$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^"([^"]*)" should have a job type of "([^"]*)"$/ do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end

Then /^"([^"]*)" should have two or more files$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then /^"([^"]*)" should have a "([^"]*)"$/ do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end

Given /^I create an "([^"]*)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then /^I should see an error message$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^the "([^"]*)" should not be added to the Job list$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then /^I should be at the new job page$/ do
  pending # express the regexp above with the code you wish you had
end

Given /^I am an Admin$/ do
  pending # express the regexp above with the code you wish you had
end

When /^I press the Completed button for the "([^"]*)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then /^I should see a confirmation request$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^the "([^"]*)" will have a status of "([^"]*)"$/ do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end

When /^a new job is created$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^the files are stored locally$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^a background job will copy the files to the compute server$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^the target directory should be "([^"]*)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then /^I should see my account information form$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should not see my role$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I update my account information$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should be at the home page$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should see the users list$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^links to create, edit and delete users$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should see the new user form$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I create the "([^"]*)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then /^I should be at the users page$/ do
  pending # express the regexp above with the code you wish you had
end

Given /^"([^"]*)" is an existing user$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then /^I should see the edit user form$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I update "([^"]*)" with new values$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Given /^"([^"]*)" is an existing user with (\d+) submitted jobs$/ do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end

When /^I click the delete link for the "([^"]*)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then /^I should see a confirmation dialogue$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^the "([^"]*)" will be deleted$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then /^jobs created by "([^"]*)" will be deleted$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then /^the "([^"]*)" will be updated with a "([^"]*)" status$/ do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end

Given /^the "([^"]*)" is completed$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

When /^I view the "([^"]*)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end