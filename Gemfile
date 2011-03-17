source 'http://rubygems.org'

RAILS_VERSION = '~> 3.0.4'
DM_VERSION    = '~> 1.0.0'
RSPEC_VERSION = '~> 2.5.0'

# Rails
gem 'activesupport',      RAILS_VERSION, :require => 'active_support'
gem 'actionpack',         RAILS_VERSION, :require => 'action_pack'
gem 'actionmailer',       RAILS_VERSION, :require => 'action_mailer'
gem 'railties',           RAILS_VERSION, :require => 'rails'

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

# CSS
gem 'compass', ">= 0.10.6"

# Auth
gem 'devise'
gem 'dm-devise'

# Bundle the extra gems:
# gem 'bj'
# gem 'nokogiri'

group :development, :test do
  # Testing
  gem 'webrat'
  gem 'rspec',              RSPEC_VERSION
  gem 'rspec-rails',        RSPEC_VERSION
  gem 'cucumber'
  gem 'cucumber-rails'
  gem 'database_cleaner'
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
end
