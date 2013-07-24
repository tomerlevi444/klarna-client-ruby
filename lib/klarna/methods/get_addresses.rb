require 'klarna/digest'

module Klarna
  module Methods
    module GetAddresses

      PNO_TYPE = 5
      TNO_TYPE = 6

      def self.xmlrpc_name
        'get_addresses'
      end

      def self.xmlrpc_params(store_id, store_secret, api_version, client_name, params)
        identifier = get_identifier(params)

        [
          identifier,
          store_id,
          digest(store_id, identifier, store_secret),
          params[:pno_encoding],
          params[:type],
          params.fetch(:client_ip, '')
        ]
      end

      private

      def self.digest(store_id, identifier, store_secret)
        array = [store_id, identifier, store_secret]

        Klarna::Digest.for(array)
      end

      def self.get_identifier(params)
        case params[:type]
        when PNO_TYPE
          params[:pno]
        when TNO_TYPE
          params[:tno]
        else
          raise ArgumentError, "Type is not valid. Got #{params[:type]}, expected #{PNO_TYPE} or #{TNO_TYPE}"
        end
      end
    end
  end
end