class JobMailer < ActionMailer::Base
  
  def job_created(job)
    @job = job
    mail(:to => [job.user.email] + User.admin_emails, :subject => 'IPPF Job Created') do |format|
        format.html { render 'job_created' }
        format.text { render 'job_created' }
    end
  end
  
  def job_complete(job)
    @job = job
    mail(:to => [job.user.email] + User.admin_emails, :subject => 'IPPF Job Complete') do |format|
        format.html { render 'job_complete' }
        format.text { render 'job_complete' }
    end    
  end
  
end
