namespace :jobs do

  desc "Go through all new/pending jobs and update their status."
  task :update => :environment do
    results = [
      0, # count
      0, # pending
      0  # complete
    ]
    Job.all(:status.not => :complete).each do |j|
      results[0] += 1
      # if the job is new, mark it as pending
      if j.new_job?
        j.status = :pending
        j.save
        results[1] += 1
      end
      
      # if the job has a 'complete' directory with contents, mark as complete
      if j.complete_files_exist? 
        j.status = :complete
        j.save
        results[2] += 1
      end
    end
    STDOUT.puts "#{Time.now} :: %d non-complete jobs checked; %d marked pending; %d marked complete" % results
  end
end