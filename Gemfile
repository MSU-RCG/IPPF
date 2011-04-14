source 'http://rubygems.org'

# Explicit Versions
RAILS_VERSION     = '~> 3.0.4'
DM_VERSION        = '~> 1.1.0'
RSPEC_VERSION     = '~> 2.5.0'
CUKER_VERSION     = '~> 0.3.2'
DM_DEVISE_VERSION = '~>1.2.0.rc'

# Rails
gem 'activesupport',      RAILS_VERSION,        :require => 'active_support'
gem 'actionpack',         RAILS_VERSION,        :require => 'action_pack'
gem 'actionmailer',       RAILS_VERSION,        :require => 'action_mailer'
gem 'railties',           RAILS_VERSION,        :require => 'rails'

# DataMapper
gem 'dm-rails',             DM_VERSION
gem 'dm-sqlite-adapter',    DM_VERSION
gem 'dm-migrations',        DM_VERSION
gem 'dm-types',             DM_VERSION
gem 'dm-validations',       DM_VERSION
gem 'dm-constraints',       DM_VERSION
gem 'dm-transactions',      DM_VERSION
gem 'dm-aggregates',        DM_VERSION
gem 'dm-timestamps',        DM_VERSION
gem 'dm-observer',          DM_VERSION
gem 'dm-timestamps',        DM_VERSION

# gem 'sqlite3'
# gem 'sqlite3-ruby', :require => 'sqlite3'

# Templates
gem 'haml-rails'
gem 'hpricot'

# CSS
gem 'compass', ">= 0.10.6"

# Auth
gem 'devise'
gem 'dm-devise',            DM_DEVISE_VERSION

# File Handling
gem 'carrierwave'
gem 'uuidtools'

# Bundle the extra gems:
# gem 'bj'
# gem 'nokogiri'

group :development do
  # Dev Webserver
  gem 'passenger'
  # Debugger
  gem 'ruby-debug'
  # Deployment
  gem 'capistrano'
  # Metrics
  #   rails g rails_metrics Metric
  #   rake db:automigrate
  gem 'rails_metrics', '~> 0.1', :git => 'git://github.com/engineyard/rails_metrics'
  # Misc
end

group :test, :development do
  gem 'rspec',              RSPEC_VERSION
  gem 'rspec-rails',        RSPEC_VERSION
  gem 'cucumber'
  gem 'cucumber-rails',     CUKER_VERSION
end

group :test do
  gem 'webrat'
  gem 'autotest-standalone'
  gem 'autotest-growl'
  gem 'autotest-fsevent'
  gem 'redgreen'  
  gem 'factory_girl'
  gem 'factory_girl_rails'
end
