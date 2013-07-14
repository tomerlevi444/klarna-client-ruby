require 'spec_helper'

describe Klarna::Client do
  include ConfigurationHelper

  let(:parameters) do
    [
      'get_addresses',
      '4.1',
      'ruby_client_SLOT',
      '410321-9202',
      1,
      'jNq2hT+orm4XPw7KoSnHr6j3WTieCJe8dsevMpu98cx8G5xbaVq7Vey3Z1kJJ4SZ4Haz9U7+J3iIs+xgNfPysw==',
      2,
      5,
      ''
    ]
  end

  describe 'something' do
    context 'given configuration settings are defined through Klarna::Configuration' do

      before do
        Klarna.configure do |config|
          config.hostname     = 'kred.test.machine'
          config.port         = 443
          config.store_id     = 1
          config.store_secret = 'supersecret'
        end
      end

      context 'given no settings are provided' do
        let(:client) { Klarna::Client.new }

        it 'creates new connection using configuration parameters defined through Klarna::Configuration' do
          expect(Klarna::Connection).to receive(:new).with('kred.test.machine', 443).and_call_original
          allow_any_instance_of(Klarna::Connection).to receive(:call)

          client.get_addresses('410321-9202',2,5,'')
        end

        it 'calls get_addresses with configuration parameters defined through Klarna::Configuration' do
          expect_any_instance_of(Klarna::Connection).to receive(:call).with(*parameters)

          client.get_addresses('410321-9202',2,5,'')
        end
      end

      context 'given new settings are provided' do
        let(:client) do
          build(:client, :hostname => 'newkred.test.machine', :port => 123, :store_id => 2, :store_secret => 'shhhhh!')
        end

        it 'creates new connection with defined parameters' do
          expect(Klarna::Connection).to receive(:new).with('newkred.test.machine', 123)
          allow_any_instance_of(Klarna::Connection).to receive(:call)

          client.get_addresses('410321-9202',2,5,'')
        end

        it 'calls get address with defined parameters' do
          expect_any_instance_of(Klarna::Connection).to receive(:call).with(*parameters2)

          client.get_addresses('410321-9202',2, 5,'')
        end
      end
    end

    context 'given no settings are provided or defined through Klarna::Configuration' do
      it 'throws an .. error' do
      end
    end
  end

  describe '.get_addresses' do
    before do
      setup_configuration('kred.test.machine', 443, 1, 'supersecret')
    end

    it 'returns the expected response' do
      expect_any_instance_of(Klarna::Connection).to receive(:call).with(*parameters)

      Klarna::Client.get_addresses('410321-9202',2,5,'')
    end
  end

  describe '#get_addresses' do
    let(:client) { build(:client) }

    it 'returns the expected response' do
      expect_any_instance_of(Klarna::Connection).to receive(:call).with(*parameters)

      client.get_addresses('410321-9202',2,5,'')
    end
  end
end
