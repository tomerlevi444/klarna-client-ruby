require 'digest'
require 'klarna-client/version'
require 'klarna-client/connection'

module Klarna
	module Client
		class Xxx
			def initialize(hostname, port, store_id, store_secret)
				@connection      = Klarna::Client::Connection.new(hostname, port)
				@store_id        = store_id
				@store_secret    = store_secret
			end

			def get_addresses(pno, pno_encoding, type, client_ip)
				@connection.xmlrpc_call('get_addresses', '4.1', 'ruby_client_SLOT', pno, @store_id, secret(pno), pno_encoding, type, client_ip)
			end

			private

			def secret(pno)
				message = [@store_id, pno, @store_secret].join(':')

				Digest::SHA512.base64digest(message)
			end
		end
	end
end
