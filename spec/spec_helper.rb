require_relative '../lib/klarna'

require 'factory_girl'
FactoryGirl.find_definitions

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods

  # VCR metadata configuration
  config.treat_symbols_as_metadata_keys_with_true_values = true
end

require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  c.hook_into :webmock

  c.filter_sensitive_data('<KlARNA_URL>')  { ENV['KLARNA_URL'] }
  c.filter_sensitive_data('<KlARNA_PORT>') { ENV['KLARNA_PORT'] }

  c.configure_rspec_metadata!
end

require 'support/configuration_helper'

require 'dotenv'
Dotenv.load
