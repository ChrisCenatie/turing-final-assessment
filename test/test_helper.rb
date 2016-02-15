ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'capybara/rails'
require 'minitest/pride'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

class ActionDispatch::IntegrationTest
  # Make the Capybara DSL available in all integration tests
  include Capybara::DSL

  def teardown
      Capybara.reset_sessions!
      Capybara.use_default_driver
    end
end

def create_user
  User.create(email: "chris@example.com", password: "password")
end

def create_user_task_list
  User.first.task_lists << TaskList.create(title: "Testing", description: "Test description")
end

def sign_user_in
  visit '/'
  fill_in "Email", with: "chris@example.com"
  fill_in "Password", with: "password"
  click_button "Login"
end
