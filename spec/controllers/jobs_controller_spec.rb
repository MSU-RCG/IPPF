require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by the Rails when you ran the scaffold generator.

describe JobsController do
  
  def mock_job(stubs={})
    @mock_job ||= mock_model(Job, stubs).as_null_object
  end

  before(:each) do
    @user = Factory(:user)
    sign_in @user
    controller.stub(:current_user) { @user }
  end

  describe "GET index" do
    describe "as an admin" do
      it "assigns all jobs as @jobs" do
        @user.should_receive(:admin?).and_return(true)
        Job.stub(:all) { mock_job }
        get :index
        assigns(:jobs).should == mock_job
      end
    end

    describe "as a non-admin" do
      it "assigns the user's jobs as @jobs" do
        @user.stub(:jobs) { [mock_job] }
        get :index
        assigns(:jobs).should eq([mock_job])
      end      
    end
  end

  describe "GET show" do
    it "assigns the requested job as @job" do
      Job.stub(:get).with("37") { mock_job }
      get :show, :id => "37"
      assigns(:job).should be(mock_job)
    end
  end

  describe "GET new" do
    it "assigns a new job as @job" do
      Job.stub(:new) { mock_job }
      get :new
      assigns(:job).should be(mock_job)
    end
  end

  describe "GET edit" do
    it "assigns the requested job as @job" do
      Job.stub(:get).with("37") { mock_job }
      get :edit, :id => "37"
      assigns(:job).should be(mock_job)
    end
  end

  describe "POST create" do
    before(:each) do
      @jf = mock_model(JobFile).as_null_object
      JobFile.stub(:all).with(:job_uuid => mock_job.uuid) { [@jf] }        
    end

    describe "with valid params" do
      it "assigns a newly created job as @job" do
        Job.stub(:new).with({'these' => 'params'}) { mock_job(:save => true, :uuid => 'foo') }
        mock_job.should_receive(:user=).with(@user)
        mock_job.should_receive(:job_files=).with([@jf])
        mock_job.should_not_receive(:status=)

        post :create, :job => {'these' => 'params'}
        assigns(:job).should be(mock_job)
      end

      it "redirects to the jobs list" do
        Job.stub(:new) { mock_job(:save => true) }
        post :create, :job => {}
        response.should redirect_to(jobs_url)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved job as @job" do
        Job.stub(:new).with({'these' => 'params'}) { mock_job(:save => false) }
        post :create, :job => {'these' => 'params'}
        assigns(:job).should be(mock_job)
      end

      it "re-renders the 'new' template" do
        Job.stub(:new) { mock_job }
        mock_job.should_receive(:save).and_return(false)
        post :create, :job => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested job" do
        Job.stub(:get).with("37") { mock_job }
        mock_job.should_receive(:update).with({'these' => 'params'})
        put :update, :id => "37", :job => {'these' => 'params'}
      end

      it "assigns the requested job as @job" do
        Job.stub(:get) { mock_job(:update => true) }
        put :update, :id => "1"
        assigns(:job).should be(mock_job)
      end

      it "redirects to the job" do
        Job.stub(:get) { mock_job(:update => true) }
        put :update, :id => "1"
        response.should redirect_to(job_url(mock_job))
      end
      
    end

    describe "with invalid params" do
      it "assigns the job as @job" do
        Job.stub(:get) { mock_job(:update => false) }
        put :update, :id => "1"
        assigns(:job).should be(mock_job)
      end

      it "re-renders the 'edit' template" do
        Job.stub(:get) { mock_job(:update => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested job" do
      Job.stub(:get).with("37") { mock_job }
      mock_job.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the jobs list" do
      Job.stub(:get) { mock_job }
      delete :destroy, :id => "1"
      response.should redirect_to(jobs_url)
    end
  end
  
  describe "POST generate_coords_txt" do
    it "regenerates the coords.txt file" do
      Job.stub(:get).with("37") { mock_job }
      mock_job.should_receive(:generate_coords_txt)
      post :generate_coords_txt, :id => "37"
    end
  end
  
end
