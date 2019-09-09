ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/autorun'
require 'minitest/spec'
require 'active_record'

class ActiveSupport::TestCase
  # Setup all fixtures in spec/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

class Minitest::Spec
  include FactoryBot::Syntax::Methods
end
