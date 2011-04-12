class JobFilesController < ApplicationController
  before_filter :authenticate_user!

  # POST /job_files/:uuid
  def create
    puts "******STARTING UPLOAD******"
    @jobfile = JobFile.new(:name => params[:name])
    @jobfile.job_uuid = params[:uuid]
    @jobfile.file = params[:file]
    status = @jobfile.save ? :created : :bad_request
    logger.info @jobfile.errors.full_messages
    render :nothing => true, :status => status
  end
end
