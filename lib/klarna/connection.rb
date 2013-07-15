require 'xmlrpc/client'

module Klarna
  class Connection
    def initialize(xmlrpc_hostname, xmlrpc_port)
      @xmlrpc_hostname = xmlrpc_hostname
      @xmlrpc_port     = xmlrpc_port

      client.http_header_extra = headers
    end

    def call(method, *args)
      client.call(method, *args)
    end

    private

    def client
      @xmlrpc_client ||= ::XMLRPC::Client.new_from_hash({
        :host    => @xmlrpc_hostname,
        :path    => '/',
        :port    => @xmlrpc_port,
        :use_ssl => use_ssl?
      })
    end

    def use_ssl?
      @xmlrpc_port == 443
    end

    def headers
      {
        'Accept-Encoding' => 'deflate,gzclient_ip',
        'Content-Type'    => 'text/xml;charset=iso-8859-1',
        'Accept-Charset'  => 'UTF-8,ISO-8859-1,US-ASCII',
        'Connection'      => 'close',
        'User-Agent'      => 'ruby/xmlrpc'
      }
    end
  end
end
