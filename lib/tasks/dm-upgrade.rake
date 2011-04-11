namespace :db do
  desc "Run the DataMapper auto_upgrade method."
  task :auto_upgrade => :environment do
    DataMapper.auto_upgrade!
  end
end