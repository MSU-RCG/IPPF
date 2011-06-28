require 'bundler/capistrano'

set :application, "ippf"
set :repository,  "git://github.com/MSU-RCG/IPPF.git"
set :use_sudo, false
set :rails_env, 'production'

set :user, 'ippf'
set :scm, :git
server "ippf.rcg.montana.edu", :web, :app, :db

# Use RVM
$:.unshift(File.expand_path('./lib', ENV['rvm_path']))
require "rvm/capistrano"
set :rvm_ruby_string, 'ruby-1.8.7-p302@ippf'

# Default deployment to development, special case for production
set :deploy_to, "/home/#{application}/rails-dev"
task :production do
  set :deploy_to, "/home/#{application}/rails"  
end

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

# Rake Tasks for to do on the server
namespace :rake do
  desc "Generate the secrets.rb file for Devise"
  task :generate_secrets do
    run "cd #{current_path}; rake generate:secrets RAILS_ENV=#{rails_env}"
    run "mv #{current_path}/config/secrets.rb #{shared_path}/config/secrets.rb"
    run "ln -nfs #{shared_path}/config/secrets.rb #{current_path}/config/secrets.rb"
  end

  desc "Populates the Production Database (DM.auto_migrate!)"
  task :db_seed do
    run "cd #{current_path}; rake db:seed RAILS_ENV=#{rails_env}"
  end
  
  desc "Upgrade the database schema"
  task :db_autoupgrade do
    run "cd #{current_path}; rake db:autoupgrade RAILS_ENV=#{rails_env}"
  end
end

# Symlinks to be made after deployment
symlinks = [
  %w(config/database.yml    config/database.yml),
  %w(config/secrets.rb      config/secrets.rb),
  %w(db/sqlite3             db/sqlite3),
  %w(public/uploads         public/uploads)
]

desc "Creates symbolic links from shared folder"
task :setup_symlinks do
  symlinks.each do |link|
    run "ln -nfs #{File.join(shared_path, link[0])} #{File.join(release_path, link[1])}"
  end
end
after "deploy:update_code", :setup_symlinks

