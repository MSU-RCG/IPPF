require 'bundler/capistrano'

set :application, "ippf"
set :repository,  "https://github.com:MSU-RCG/IPPF.git"
set :use_sudo, false

set :user, 'ippf'
set :scm, :git

server "#{application}.rcg.montana.edu", :web, :app, :db

set :deploy_to, "/home/ippf/#{application}-dev"
task :production do
  set :deploy_to, "/home/ippf/#{application}"  
end

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
