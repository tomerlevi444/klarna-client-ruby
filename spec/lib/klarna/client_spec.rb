require 'spec_helper'

describe Klarna::Client do
  include ConfigurationHelper

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
      },
      {
        :company_name => 'Testcompany-se',
        :street       => 'lillegatan 1',
        :zip          => '12334',
        :city         => 'Ankeborg',
        :country      => 'Sweden',
        :type         => :company
      }
    ]
  end

  describe '.get_addresses' do
    before do
      setup_configuration
    end

    context 'given a person with PNO 410321-9202' do
      let(:pno) { '410321-9202' }

      it 'returns the expected response' do
        VCR.use_cassette 'get_addresses for PNO 410321-9202' do
          addresses = Klarna::Client.get_addresses(pno, 2, 5, '')

          expect(addresses).to eq(person_addresses)
        end
      end
    end

    context 'given a company with PNO 002031-0132' do
      let(:pno) { '002031-0132' }

      it 'returns the expected response' do
        VCR.use_cassette 'get_addresses for PNO 002031-0132' do
          addresses = Klarna::Client.get_addresses(pno, 2, 5, '')

          expect(addresses).to eq(company_addresses)
        end
      end
    end
  end

  describe '#get_addresses' do
    let(:client) do
      build(:client)
    end

    context 'given a person with PNO 410321-9202' do
      let(:pno) { '410321-9202' }

      it 'returns the expected response' do
        VCR.use_cassette 'get_addresses for PNO 410321-9202' do
          addresses = client.get_addresses(pno, 2, 5, '')

          expect(addresses).to eq(person_addresses)
        end
      end
    end

    context 'given a company with PNO 002031-0132' do
      let(:pno) { '002031-0132' }

      it 'returns the expected response' do
        VCR.use_cassette 'get_addresses for PNO 002031-0132' do
          addresses = client.get_addresses(pno, 2, 5, '')

          expect(addresses).to eq(company_addresses)
        end
      end
    end
  end
end
