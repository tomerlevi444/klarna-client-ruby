require 'xmlrpc/client'

module Klarna
	module Client
		class Connection
			attr_accessor :xmlrpc_hostname
			attr_accessor :xmlrpc_port

			def initialize(xmlrpc_hostname, xmlrpc_port)
				self.xmlrpc_hostname = xmlrpc_hostname
				self.xmlrpc_port     = xmlrpc_port

				@xmlrpc_client = ::XMLRPC::Client.new_from_hash({
					:host    => xmlrpc_hostname,
					:path    => '/',
					:port    => xmlrpc_port,
					:use_ssl => xmlrpc_port == 443
				})

				@xmlrpc_client.http_header_extra = headers
			end

			def xmlrpc_call(method, *args)
				@xmlrpc_client.call(method, *args)
			end

			private

			def headers
				{
					'Accept-Encoding' => 'deflate,gzclient_ip',
					'Content-Type' => 'text/xml;charset=iso-8859-1',
					'Accept-Charset' => 'UTF-8,ISO-8859-1,US-ASCII',
					'Connection' => 'close',
					'User-Agent' => 'ruby/xmlrpc'
				}
			end
		end
	end
end