require 'spec_helper'

def contain(*args)
  simple_matcher("contain") { |given| given.include?(args) }
end


describe Job do
  
  it "Should be valid with valid values" do
    job = Factory(:job)
    job.should be_valid
  end
  
  it "Should belong to a user" do
    job = Factory(:job)
    job.should respond_to(:user)
  end
  
  it "Should be invalid without a user" do
    job = Factory.build(:job, :user => nil)
    job.user.should be_nil
    job.should_not be_valid
    job.errors.on(:user_id).should_not be_empty
  end
  
  it "should be invalid without a job_type" do
    job = Factory.build(:job, :job_type => nil)
    job.should_not be_valid
    job.errors.on(:job_type).should_not be_empty
  end 
  
  it "should expose the valid job_types" do
    Job.should respond_to(:job_types)
    Job.job_types.should be_kind_of Array
    Job.job_types.should_not be_nil
  end
  
  it "should include 'shape' and 'transect' in the job_types" do
    [:shape, :transect].each do |j|
      Job.job_types.should include(j)
    end
  end
  
  it "should be invalid if the job_type is not 'shape' or 'transect'" do
    ['foo', ' ', 'squid'].each do |j|
      job = Factory.build(:job, :job_type => j)
      job.should_not be_valid
      job.errors.on(:job_type).should_not be_empty
    end
    Job.job_types.each do |j|
      job = Factory(:job, :job_type => j)
      job.should be_valid
    end
  end
  
  it "should be invalid without a status" do
    job = Factory.build(:job, :job_type => nil)
    job.should_not be_valid
    job.errors.on(:job_type).should_not be_empty
  end 
  
  it "should be invalid if the status is not 'new','pending' or 'complete'" do
    [:foo, :' ', :squid].each do |j|
      job = Factory.build(:job, :status => j)
      job.should_not be_valid
      job.errors.on(:status).should_not be_empty
    end
    [:pending, :complete, :new].each do |j|
      job = Factory(:job, :status => j)
      job.status.should == j
      job.should be_valid
    end
  end
  
  it "should have a statuses method with the statuses in the right order" do
    Job.statuses.should == [:new, :pending, :complete]
  end
  
  it "should have a status of 'new' when it is created" do
    job = Job.new
    job.status.should == :new
  end
  
  it "should be invalid without a name" do
    job = Factory.build(:job, :name => nil)
    job.should_not be_valid
    job.errors.on(:name).should_not be_empty
  end
  
  it "should be invalid when missing any of its coordinates" do
    [:x1, :x2, :y1, :y2].each do |coord|
      job = Factory(:job, coord => nil)
      job.should_not be_valid
      job.errors.on(coord).should_not be_empty
    end
  end
  
  it "should output the set of coordinates when called" do
    job = Factory.build(:job)
    job.should respond_to(:coordinates)
    job.coordinates.should == "X1:1234  Y1:7 890 X2:890 Y2:1290"
  end
  
  it "should optionally have notes" do
    job = Factory(:job, :notes => nil)
    job.should be_valid
  end

  it "should have many job files" do
    job = Factory(:job)
    job.should respond_to(:job_files)
    job.job_files.should be_kind_of Array
  end
  
  it "should be invalid without at least one job_file" do
    job = Factory(:job, :job_files => [])
    job.should_not be_valid
    job.errors.on(:job_files).should_not be_empty
  end
  
  it "should have timestamps" do
    job = Factory(:job)
    [:created_at, :created_on, :updated_at, :updated_on].each do |ts|
      job.should respond_to(ts)
    end
  end
  
  it "should have a uuid" do
    job = Factory.build(:job)
    job.uuid.should_not be_nil
  end
  
  
end
