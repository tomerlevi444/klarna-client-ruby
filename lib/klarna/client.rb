require 'digest'

require 'klarna/methods/get_addresses'
require 'klarna/methods/reserve_amount'

module Klarna
  class Client
    VERSION = '4.1'
    NAME    = 'ruby_client'

    def initialize(options = {})
      @hostname     = options[:hostname]     || Klarna.configuration.hostname
      @port         = options[:port]         || Klarna.configuration.port
      @store_id     = options[:store_id]     || Klarna.configuration.store_id
      @store_secret = options[:store_secret] || Klarna.configuration.store_secret
    end

    def get_addresses(params)
      call_method(Klarna::Methods::GetAddresses, params)
    end

    def self.get_addresses(params)
      new.get_addresses(params)
    end

    def reserve_amount(params)
      call_method(Klarna::Methods::ReserveAmount, params)
    end

    def self.reserve_amount(params)
      new.reserve_amount(params)
    end

    private

    def call_method(method, params)
      connection.call(method.name, VERSION, NAME, *method.params(@store_id, @store_secret, params))
    end

    def connection
      @connection ||= Klarna::Connection.new(@hostname, @port)
    end

  end
end
