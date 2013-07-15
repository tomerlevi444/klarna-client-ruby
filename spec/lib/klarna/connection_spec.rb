require 'spec_helper'

describe Klarna::Connection do
  subject { build(:connection) }

  describe '#call' do
    it 'delegates method execution to a XMLRPC::Client instance' do
      expect_any_instance_of(::XMLRPC::Client).to receive(:call).with('endpoint', 'arg1', 'arg2')

      subject.call('endpoint', 'arg1', 'arg2')
    end
  end
end
