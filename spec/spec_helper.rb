require_relative '../lib/klarna'

require_relative 'support/configuration_helper'

require 'factory_girl'
FactoryGirl.find_definitions

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end