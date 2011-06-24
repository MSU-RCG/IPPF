require "spec_helper"

describe JobMailer do
  
  before(:each) do
    @user = Factory(:user_with_jobs)
    @job = @user.jobs.first
  end
  
  it "should render job_created successfully" do
    lambda { JobMailer.job_created(@job) }.should_not raise_error
  end
  
  it "should render job_complete successfully" do
    lambda { JobMailer.job_complete(@job) }.should_not raise_error
  end
   
end
