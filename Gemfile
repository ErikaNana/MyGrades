ruby '1.9.3'
source 'http://rubygems.org'

gem 'rails', '3.2.14'

gem 'bootstrap-sass'
# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

# for Heroku deployment - as described in Ap. A of ELLS book
group :development, :test do
  gem 'sqlite3'
  gem 'ruby-debug19'
end

group :production do
  gem 'pg'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'therubyracer'
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier'
end

gem 'jquery-rails'
gem 'haml'

group :test, :development do
    gem 'cucumber-rails', :require => false
    gem 'cucumber-rails-training-wheels'
    gem 'database_cleaner'
    gem 'capybara'
    gem 'launchy'
end
# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'
