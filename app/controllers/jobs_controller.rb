class JobsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :use_nav
  
  # GET /jobs
  # GET /jobs.xml
  def index
    @page_title = "IPPF :: Jobs"
    if current_user.admin?
      @jobs = Job.all(:order => :created_at.desc)
    else
      @jobs = current_user.jobs
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @jobs }
    end
  end

  # GET /jobs/1
  # GET /jobs/1.xml
  def show
    @job = Job.get(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @job }
    end
  end

  # GET /jobs/new
  # GET /jobs/new.xml
  def new
    @job = Job.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @job }
    end
  end

  # GET /jobs/1/edit
  def edit
    @job = Job.get(params[:id])
  end

  # POST /jobs
  # POST /jobs.xml
  def create
    @job = Job.new(params[:job])
    @job.job_files = JobFile.all(:job_uuid => @job.uuid)
    @job.user = current_user
    
    respond_to do |format|
      if @job.save
        JobMailer.job_created(@job).deliver
        format.html { redirect_to(jobs_url, :notice => 'Job was successfully created.') }
        format.xml  { render :xml => @job, :status => :created, :location => @job }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @job.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /jobs/1
  # PUT /jobs/1.xml
  def update
    @job = Job.get(params[:id])

    respond_to do |format|
      if @job.update(params[:job])
        format.html { redirect_to(@job, :notice => 'Job was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @job.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.xml
  def destroy
    @job = Job.get(params[:id])
    @job.destroy

    respond_to do |format|
      format.html { redirect_to(jobs_url) }
      format.xml  { head :ok }
    end
  end
  
end
