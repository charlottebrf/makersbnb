
# ENV["RACK_ENV"] = "test"

require 'capybara/rspec'
require_relative "../app/app"
require_relative './app/models/user.rb'
require_relative './app/models/space.rb'

Capybara.app = Makersbnb


RSpec.configure do |config|

  config.expect_with :rspec do |expectations|

    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|

    mocks.verify_partial_doubles = true
  end


  config.shared_context_metadata_behavior = :apply_to_host_groups

end
