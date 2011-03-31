require 'spec_helper'

describe JobFile do
  
  it "should be valid" do
    j = Factory.build(:job_file)
    j.should be_valid
  end
  
  it "should be invalid without a job" do
    j = Factory.build(:job_file, :job => nil)
    j.should_not be_valid
    j.errors.on(:job_id).should_not be_empty
  end
  
  it "should have a file" do
    j = Factory.build(:job_file)
    j.should respond_to(:file)
  end
  
  it "should have timestamps" do
    job = Factory(:job_file)
    [:created_at, :created_on, :updated_at, :updated_on].each do |ts|
      job.should respond_to(ts)
    end
  end
  
end
