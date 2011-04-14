require 'spec_helper'

describe JobFilesController do

  def mock_job_file(stubs={})
    @mock_job_file ||= mock_model(JobFile, stubs).as_null_object
  end

  before(:each) do
    @user = Factory(:user)
    sign_in @user
  end

  describe "POST create (job_files/:uuid)" do
    it "assigns a newly created job as @job" do
      JobFile.stub(:new).with({:name => 'foo.file'}) { mock_job_file(:save => true) }
      mock_job_file.should_receive(:job_uuid=).with('foo')
      post :create, :Filename => 'foo.file', :job_file => 'blarg', :uuid => 'foo'
      assigns(:job_file).should be(mock_job_file)
    end
  end

  describe "DELETE job_files/:uuid" do
    it "destroys the job files" do
      pending "Write this test when you need it."
    end
  end

end
