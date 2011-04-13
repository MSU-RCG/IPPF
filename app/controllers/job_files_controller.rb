class JobFilesController < ApplicationController
  # before_filter :authenticate_user!

  # POST /job_files/:uuid
  def create
    @job_file = JobFile.new(:name => params[:Filename])
    @job_file.job_uuid = params[:uuid]
    @job_file.file = params[:job_file][:file]
    if @job_file.save
      render :text => render_to_string( :partial => 'job_files/job_file', 
                                        :locals => {:job_file => @job_file})
    else
      flash[:error] = 'Job File could not be uploaded'
      render :nothing => true, :status => 500
    end
  end
  
end
