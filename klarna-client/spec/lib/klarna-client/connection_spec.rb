require 'spec_helper'

describe Klarna::Client::Connection do
	describe '#initialize' do
		context 'given hostname and port' do
    		attr_accessor :xmlrpc_hostname
    		attr_accessor :xmlrpc_port

			let(:xmlrpc_hostname) { 'klarna_host' }
			let(:xmlrpc_port)     { 12345 }
			let(:connection)      { Connection.new(xmlrpc_hostname, xmlrpc_port) }

			it 'initializes the hostname attribute' do
				expect(connection.xmlrpc_hostname).to eq(xmlrpc_hostname)
			end

			it 'initializes the port attribute' do
				expect(connection.xmlrpc_port).to eq(xmlrpc_port)
			end
		end
	end

	describe '#get_addresses' do
	end
end