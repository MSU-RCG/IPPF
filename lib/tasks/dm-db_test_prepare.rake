namespace :db do
  namespace :test do
    desc "Auto-migrate the database via Datamapper if the environment is 'test'"
    task :prepare do
      DataMapper.auto_migrate! if Rails.env == 'test'
    end
  end
end