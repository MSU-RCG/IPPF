class JobMailer < ActionMailer::Base
  default :from => "ippf-support@rcg.msu.montana.edu" if Rails.env == 'production'
  
  def job_created(job)
    @job = job
    mail(
      :to => [job.user.email] + User.admin_emails, 
      :subject => 'IPPF Job Created') 
    
  
  end
end
