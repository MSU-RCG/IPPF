namespace :generate do
  desc "Generate a config/secrets.rb file. Do not include this file in a public repository."
  task :secrets do
    Rails.root
    file = File.join(Rails.root,'config','secrets.rb')
    if File.exists?(file)
      STDERR.puts "*** The 'config/secrets.rb' file already exists, manually delete it. ***" 
      exit
    end

    # generate random strings
    secret_pepper = ActiveSupport::SecureRandom.base64(128)
    secret_token  = ActiveSupport::SecureRandom.base64(128)

    File.open(file, 'w') do |f| 
      f.write(<<-EOF)
# Salt/Pepper and other secret spices that shouldn't be in the repository.
# DON'T COMMIT THIS FILE TO A PUBLIC REPOSITORY
DEVISE_PEPPER = '#{secret_pepper}'
SECRET_TOKEN = '#{secret_token}'
EOF
    end
  end
end