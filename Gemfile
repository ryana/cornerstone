source 'http://rubygems.org'

# Framework
gem 'rails', '3.2.5'
gem 'jquery-rails'

 #DB
gem 'mongo_mapper'
gem 'mongo_ext'
gem 'bson_ext'

# Auth
gem 'devise'
gem 'mm-devise'
gem 'omniauth'
gem 'omniauth-facebook'
gem 'omniauth-twitter'
 
# Extras
gem 'sendgrid'
gem 'stripe', '1.6.2'
gem 'typhoeus'

gem 'resque'
gem 'resque_mailer'

gem 'formtastic'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier'
end

group :test do
  gem 'autotest-fsevent', '0.2.4', :require => 'autotest/fsevent'
  gem 'autotest-rails', '4.1.0', :require => 'autotest/rails'
  gem 'capybara'
  gem 'selenium-client'
  gem 'ZenTest'
  gem 'mocha'
  gem 'factory_girl'
  gem 'shoulda'
end

# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
group :development, :test do
  gem 'capistrano'
end
