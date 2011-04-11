class JobFilesController < ApplicationController
  before_filter :authenticate_user!

  # POST /job_files/:uuid
  def create
    @jobfile = JobFile.new(:name => params[:name])
    @jobfile.job_uuid = params[:uuid]
    @jobfile.file = params[:file]  
    status = @jobfile.save ? :created : :bad_request
    render :nothing => true, :status => status
  end
end
