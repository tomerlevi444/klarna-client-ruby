require 'digest'

module Klarna
  module Methods
    module Activate
      def self.name
        'activate'
      end

      def self.params(store_id, store_secret, api_version, client_name, params)
        [
          store_id,
          digest(store_id, store_secret, api_version, client_name, params),
          params[:rno],
          params.fetch(:optional_info, {})
        ]
      end

      private

      OPTIONAL_INFO_KEYS =
        [
          :bclass,
          :cust_no,
          :flags,
          :ocr,
          :orderid1,
          :orderid2,
          :reference,
          :reference_code
        ]

      def self.digest(store_id, store_secret, api_version, client_name, params)
        digest_array = [api_version.gsub(".", ":"), client_name, store_id, params[:rno]]

        optional_info = params[:optional_info]
        add_optional_info(digest_array, optional_info) unless optional_info.nil?

        digest_array.push(store_secret)

        message = digest_array.join(':')
        Digest::SHA512.base64digest(message)
      end

      def self.add_optional_info(digest_array, optional_info)
        OPTIONAL_INFO_KEYS.each do |key|
          if optional_info.has_key?(key)
            digest_array.push(optional_info[key])
          end
        end

        if optional_info.has_key?(:artnos)
          optional_info[:artnos].each do |article|
            digest_array.push(article[:artno])
            digest_array.push(article[:qty])
          end
        end
      end

    end
  end
end