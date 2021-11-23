# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# Nokogiri
gem 'nokogiri', '~> 1.12.5'

# Discord OAuth
gem 'omniauth', '~> 2.0.4'
gem 'omniauth-discord', '~> 1.0.2'
gem 'omniauth-rails_csrf_protection', '~> 1.0.0'

gem 'jwt', '~> 2.3.0'
gem 'rack-cors', '~> 1.1.1'

# Faraday HTTP
gem 'faraday', '~> 1.8.0'

# Forms
gem 'simple_form', '~> 5.1.0'

# MariaDB
gem 'mysql2', '~> 0.5.3'

# Simple search for SQL
gem 'minidusen', '~> 0.10'

# Hamburger menus
# gem 'hamburgers'

# File handling
gem 'carrierwave', '~> 2.2.2'
gem 'file_validators', '~> 3.0.0'

gem 'responders', '~> 3.0.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.1.4'
# Ruby >=3.0 required rexml
gem 'rexml', '~> 3.2.5'
# Use SCSS for stylesheets
gem 'sassc-rails', '~> 2.1.2'
# gem 'sassc'
# Use sqlite3 as the database for Active Record
gem 'sqlite3', '~> 1.4.2'
# Use Puma as the app server
gem 'puma', '~> 5.5.2'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 5.4.3'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5.2.1'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.11.2'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
gem 'bcrypt', '~> 3.1.16'
# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.9.1', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
end

group :development do
  gem 'rubocop', '~>1.21.0'
  gem 'rubocop-performance', '~>1.11.5'
  gem 'rubocop-rspec', '~>2.5.0'
  gem 'rubocop-sequel', '~>0.3.3'
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 4.1.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 3.36'
  gem 'selenium-webdriver', '~> 4.0.3'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers', '~> 5.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
