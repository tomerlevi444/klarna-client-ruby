require 'klarna/digest'

module Klarna
  module Methods
    module GetAddresses

      def self.xmlrpc_name
        'get_addresses'
      end

      def self.xmlrpc_params(store_id, store_secret, api_version, client_name, params)
        [
          params[:pno],
          store_id,
          digest(store_id, params[:pno], store_secret),
          params[:pno_encoding],
          params[:type],
          params.fetch(:client_ip, '')
        ]
      end

      private

      def self.digest(store_id, pno, store_secret)
        array = [store_id, pno, store_secret]

        Klarna::Digest.for(array)
      end

    end
  end
end
