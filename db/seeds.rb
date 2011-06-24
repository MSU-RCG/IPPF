# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

DataMapper.auto_migrate!

User.create(
  :email                 => 'admin@ippf.rcg.montana.edu', 
  :admin                 => true, 
  :password              => 'password', 
  :password_confirmation => 'password',
  :first_name            => 'Sys',
  :last_name             => 'Admin',
  :city                  => 'Bozeman',
  :state                 => 'MT'
)