require 'spec_helper'

def contain(*args)
  simple_matcher("contain") { |given| given.include?(args) }
end


describe Job do
  
  it "Should be valid with valid values" do
    job = Factory(:job)
    job.should be_valid
  end

  it "Should save a valid job successfully" do
    initial = Job.count
    Factory(:job)
    Job.count.should == initial+1
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
      job = Factory.build(:job)
      job.status = j
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
    [:x_min, :x_max, :y_min, :y_max].each do |coord|
      job = Factory(:job, coord => nil)
      job.should_not be_valid
      job.errors.on(coord).should_not be_empty
    end
  end
  
  it "should output the set of coordinates when called" do
    job = Factory.build(:job)
    job.should respond_to(:coordinates)
    job.coordinates.should =~ /Xmin:-[\d]+.[\d]+ Ymin:[\d]+.[\d]+ Xmax:-[\d]+.[\d]+ Ymax:[\d]+.[\d]+/
  end
  
  it "should have float coordinate types" do
    job = Factory.build(:job)
    [:x_min, :x_max, :y_min, :y_max].each do |coord|
      job[coord].should be_kind_of Float
    end
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
  
  it "should accept floats/ints as valid coordinates" do
    job = Factory(:job, {
      :x_min => 1.234,
      :y_min => 324,
      :x_max => 456,
      :y_max => 1234.545367      
    })
    gob = Job.get(job.id)
    gob.x_min.should == job.x_min
    gob.y_min.should == job.y_min
    gob.x_max.should == job.x_max
    gob.y_max.should == job.y_max
  end
  
  describe "should validate coordinates" do
    describe "valid Y values" do
      it "should have at least a precision of 12 and a scale of 10" do
        job = Factory(:job, {
          :y_min => 40.1234567891,
          :y_max => 40.2345678912
        })
        gob = Job.get(job.id)
        gob.y_min.should == 40.1234567891
        gob.y_max.should == 40.2345678912
      end
      
      it "should have y_max with a maximum of 49" do
        job = Factory(:job)
        job.y_min = 48
        job.y_max = 50
        job.should_not be_valid
        job.y_max = 49
        job.should be_valid
      end
      
      it "should have y_min with a minimum of 32.5" do
        job = Factory(:job)
        job.y_max = 33
        job.y_min = 31
        job.should_not be_valid
        job.y_min = 32.5
        job.should be_valid
      end
      
      it "should have a y_max larger than y_min" do
        job = Factory(:job, :y_max => 33, :y_min => 33.1)
        job.should_not be_valid
        job.y_max = 33.1
        job.y_min = 33
        job.should be_valid
      end
    end
    
    describe "valid X values" do
      it "should have at least a precision of 13 and a scale of 10" do
        job = Factory(:job, {
          :x_min => -122.1234567891,
          :x_max => -96.1234567891
        })
        gob = Job.get(job.id)
        gob.x_min.should == -122.1234567891
        gob.x_max.should == -96.1234567891
      end

      it "should have x_max with a maximum of -96.0" do
        job = Factory(:job)
        job.x_min = -97
        job.x_max = -95
        job.should_not be_valid
        job.x_max = -96
        job.should be_valid
      end
      
      it "should have x_min with a minimum of -123" do
        job = Factory(:job)
        job.x_max = -122
        job.x_min = -124
        job.should_not be_valid
        job.x_min = -123
        job.should be_valid
      end
      
      it "should have a x_max larger than x_min" do
        job = Factory(:job, :x_max => -100, :x_min => -98)
        job.should_not be_valid
        job.x_max = -98
        job.x_min = -100
        job.should be_valid
      end
      
    end
    
    it "should respond to a coordinate_area method" do
      job = Factory(:job, {
        :x_max => -122.5, 
        :x_min => -123,
        :y_max => 33, 
        :y_min => 32.5
      })
      
      job.coordinate_area.should == 0.25
    end
    
    it "should only be valid if (xMax - xMin) * (yMax - yMin) < 0.25" do
      job = Factory(:job, {
        :x_max => -122.6, 
        :x_min => -123,
        :y_max => 33, 
        :y_min => 32.5
      })
      
      job.coordinate_area.should < 0.25
      job.should be_valid
      job.x_max = -98
      job.coordinate_area.should > 0.25
      job.should_not be_valid
    end
  end
  
  it "should respond to :complete_files_exist? with true when the complete folder is present" do
    job = Factory(:job)
    job.should respond_to(:complete_files_exist?)
  end
  
  it "should respond to a :complete_files_dir with the directory for completed files" do
    job = Factory(:job)
    job.should respond_to(:complete_files_dir)
    job.job_files.first.stub(:file_url).and_return('/uploads/6cf2fff2-5b5c-11e0-ada7-002332d6f1b2/foo.txt')
    job.job_files.first.file_url.should == '/uploads/6cf2fff2-5b5c-11e0-ada7-002332d6f1b2/foo.txt'
    job.complete_files_dir.should == Rails.public_path + '/uploads/6cf2fff2-5b5c-11e0-ada7-002332d6f1b2' + '/complete' 
  end
  
  it "should have convenient boolean accessors for the states" do
    job = Factory(:job)
    job.should respond_to(:new_job?)
    job.status = :new
    job.should be_new_job
    
    job.should respond_to(:pending_job?)
    job.status = :pending
    job.should be_pending_job
    
    job.should respond_to(:complete_job?)
    job.status = :complete
    job.should be_complete_job
  end
  
  it "should send out a mail after creation" do
    job = Factory.new(:job)
    job.should be_new
    job.should be_valid
    job.save
    Job.should_receive(:send_create_notification)
    JobMailer.should_receive(:job_created).with(job)
  end

  it "should send out a mail after updated to complete" do
    JobMailer.should_receive(:job_complete)
    job = Factory(:job)
    job.status = :complete
    job.save
  end

end
