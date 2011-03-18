if File.exists?(File.join(Rails.root, 'config', 'secrets.rb'))
  require File.join(Rails.root, 'config', 'secrets')
else
  STDERR.puts "*** The secrets file does not exist, please run `rake generate:secrets` ***"
  exit(1)
end
# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
Ippf::Application.config.secret_token = SECRET_TOKEN