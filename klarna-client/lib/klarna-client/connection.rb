module Klarna
	module Client
		class Connection
    		attr_accessor :xmlrpc_hostname
    		attr_accessor :xmlrpc_port

    		def initialize(xmlrpc_hostname, xmlrpc_port)
    			self.xmlrpc_hostname = xmlrpc_hostname
    			self.xmlrpc_port     = xmlrpc_port
    		end
		end
	end
end