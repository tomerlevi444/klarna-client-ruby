require 'spec_helper'

describe Klarna::Configuration do
  subject { Klarna::Configuration.new }

  it { should respond_to(:hostname) }
  it { should respond_to(:port) }
  it { should respond_to(:store_id) }
  it { should respond_to(:store_secret) }
end
