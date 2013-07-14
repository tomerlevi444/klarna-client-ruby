require 'digest'

module Klarna
  class Client
    def initialize(options = {})
      @hostname     = options[:hostname]     || Klarna.configuration.hostname
      @port         = options[:port]         || Klarna.configuration.port
      @store_id     = options[:store_id]     || Klarna.configuration.store_id
      @store_secret = options[:store_secret] || Klarna.configuration.store_secret
    end

    def self.get_addresses(pno, pno_encoding, type, client_ip)
      new.get_addresses(pno, pno_encoding, type, client_ip)
    end

    def get_addresses(pno, pno_encoding, type, client_ip)
      connection.call('get_addresses', '4.1', 'ruby_client_SLOT', pno, @store_id, secret(pno), pno_encoding, type, client_ip)
    end

    private

    def connection
      @connection ||= Klarna::Connection.new(@hostname, @port)
    end

    def secret(pno)
      message = [@store_id, pno, @store_secret].join(':')

      Digest::SHA512.base64digest(message)
    end
  end
end

