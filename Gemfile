# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.0.4"

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "sprockets-rails"

# Use sqlite3 as the database for Active Record
gem "sqlite3", "~> 1.4"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 5.0"

# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem "importmap-rails"

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails"

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder"

# Use Redis adapter to run Action Cable in production
gem "redis", "~> 4.0"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Use Sass to process CSS
# gem "sassc-rails"

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"
gem 'aasm', "~> 5.3.1"
gem "activeadmin", "~> 2.13.1"
gem 'activeadmin_addons'
gem "chilean_cities", git: "https://github.com/platanus/chilean_cities"
gem "devise", "~> 4.8.1"
gem 'enumerize', "~> 2.5.0"
gem "httparty", "~> 0.20.0"
gem "nokogiri", "~> 1.13.8"
gem "power-types"
gem "sass-rails", "~> 6.0.0"
gem "sidekiq", "~> 6.5"
gem "strong_migrations", "~> 1.3.1"
gem 'wisper', '2.0.0'

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[mri mingw x64_mingw]
  gem 'dotenv-rails', "~> 2.8.1"
  gem 'factory_bot'
  gem 'faker', git: 'https://github.com/faker-ruby/faker.git', branch: 'master'
  gem "pry", "~> 0.14.1"
  gem "rspec-rails", "~> 5.1.2"
  gem "rubocop", "~> 1.36.0"
  gem "rubocop-flexport", "~> 0.10.2"
  gem "rubocop-performance", "~> 1.15.0"
  gem "rubocop-rails", "~> 2.16.1"
  gem "rubocop-rspec", "~> 2.13.2"
  gem "solargraph", "~> 0.43.3"
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end


gem "whenever", "~> 1.0"
