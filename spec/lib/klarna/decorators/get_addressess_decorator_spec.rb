require 'spec_helper'

describe Klarna::Decorators::GetAddressesDecorator do
  describe '#addresses' do

    let(:person_addresses) do
      [{
        :first_name => 'Testperson-se',
        :last_name  => 'Approved',
        :street     => 'Stårgatan 1',
        :zip        => '12345',
        :city       => 'Ankeborg',
        :country    => 'Sweden',
        :type       => :person
      }]
    end

    let(:company_addresses) do
      [
        {
          :company_name => 'Testcompany-se',
          :street       => 'Stårgatan 1',
          :zip          => '12345',
          :city         => 'Ankeborg',
          :country      => 'Sweden',
          :type         => :company
        }
      ]
    end

    context 'given an array of addresses with 5 elements' do
      let(:array) do
        [["Testcompany-se", "Stårgatan 1", "12345", "Ankeborg", "209"]]
      end

      it 'returns an array of company hashes' do
        decorated_addresses = Klarna::Decorators::GetAddressesDecorator.new(array).addresses

        expect(decorated_addresses).to eq(company_addresses)
      end
    end

    context 'given an array of addresses with 6 elements' do
      let(:array) do
        [["Testperson-se", "Approved", "Stårgatan 1", "12345", "Ankeborg", "209"]]
      end

      it 'returns an array of person hashes' do
        decorated_addresses = Klarna::Decorators::GetAddressesDecorator.new(array).addresses

        expect(decorated_addresses).to eq(person_addresses)
      end

    end
  end
end
