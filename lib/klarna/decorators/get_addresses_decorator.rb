module Klarna
  module Decorators
    class GetAddressesDecorator
      attr_reader :addresses

      def initialize(addresses)
        self.addresses = addresses
      end

      private

      def addresses=(addresses)
        @addresses = addresses.map do |address|
          case address.size
          when 5
            company_address(address)
          when 6
            person_address(address)
          end
        end
      end

      def person_address(address)
        {
          :first_name => address[0],
          :last_name  => address[1],
          :street     => address[2],
          :zip        => address[3],
          :city       => address[4],
          :country    => Klarna::COUNTRIES[address[5]],
          :type       => :person
        }
      end

      def company_address(address)
        {
          :company_name => address[0],
          :street       => address[1],
          :zip          => address[2],
          :city         => address[3],
          :country      => Klarna::COUNTRIES[address[4]],
          :type         => :company
        }
      end

    end
  end
end
