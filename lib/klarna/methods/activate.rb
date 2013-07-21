require 'klarna/digest'

module Klarna
  module Methods
    module Activate
      def self.xmlrpc_name
        'activate'
      end

      def self.xmlrpc_params(store_id, store_secret, api_version, client_name, params)
        [
          store_id,
          digest(api_version, client_name, store_id, params[:rno], params[:optional_info], store_secret),
          params[:rno],
          params.fetch(:optional_info, {})
        ]
      end

      private

      def self.digest(api_version, client_name, store_id, rno, optional_info, store_secret)
        version = api_version.gsub('.', ':')
        optional_info_for_digest = optional_info_for_digest(optional_info)

        array = [version, client_name, store_id, rno, *optional_info_for_digest, store_secret]
        Klarna::Digest.for(array)
      end


      OPTIONAL_INFO_KEYS = [
        :bclass,
        :cust_no,
        :flags,
        :ocr,
        :orderid1,
        :orderid2,
        :reference,
        :reference_code
      ]

      def self.optional_info_for_digest(optional_info)
        array = []

        if optional_info
          array.concat optional_info_values(optional_info)
          array.concat articles(optional_info)
        end

        array
      end

      def self.optional_info_values(optional_info)
        optional_info.values_at(*OPTIONAL_INFO_KEYS).compact
      end

      def self.articles(optional_info)
        articles = []

        optional_info[:artnos].each do |article|
          articles.push article[:artno]
          articles.push article[:qty]
        end

        articles
      end

    end
  end
end
