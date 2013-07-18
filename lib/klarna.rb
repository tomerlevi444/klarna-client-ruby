require 'klarna/version'
require 'klarna/client'
require 'klarna/configuration'
require 'klarna/connection'

module Klarna
  def self.configure
    yield configuration if block_given?
  end

  def self.configuration
    @configuration ||= Klarna::Configuration.new
  end
end
