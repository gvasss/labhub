# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'

ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
require 'capybara/poltergeist'
require 'factory_bot_rails'
require 'capybara/rspec'

# Checks for pending migrations and applies them before tests are run.
begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  abort e.to_s.strip
end

RSpec.configure do |config|
  # Add Devise helpers for feature specs
  config.include Devise::Test::IntegrationHelpers, type: :feature
  config.include FactoryBot::Syntax::Methods

  # Set JavaScript driver for Capybara
  Capybara.javascript_driver = :selenium_chrome_headless
  Capybara.server = :puma

  # Configure Database Cleaner
  config.use_transactional_fixtures = false

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each, js: true) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  # Additional RSpec configuration
  config.fixture_paths = [Rails.root.join('spec/fixtures')]
  config.filter_rails_from_backtrace!
end