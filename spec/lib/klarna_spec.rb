require 'spec_helper'

describe Klarna do
  include ConfigurationHelper

  describe '.configure' do
    context 'given a configuration block' do
      before do
        setup_configuration
      end

      it 'sets "kred.test.machine" to Kred.configuration.hostname' do
        expect(Klarna.configuration.hostname).to eq(ENV['KLARNA_URL'])
      end

      it 'sets 443 to Kred.configuration.port' do
        expect(Klarna.configuration.port).to eq(ENV['KLARNA_PORT'])
      end

      it 'sets 1 to Kred.configuration.store_id' do
        expect(Klarna.configuration.store_id).to eq(ENV['KLARNA_STORE_ID'].to_i)
      end

      it 'sets "supersecret" to Kred.configuration.store_secret' do
        expect(Klarna.configuration.store_secret).to eq(ENV['KLARNA_STORE_SECRET'])
      end
    end
  end

  describe '.configuration' do
    it 'creates a Klarna::Configuration object' do
      expect(Klarna.configuration).to be_an_instance_of(Klarna::Configuration)
    end

    context 'given a Klarna::Configuration object already exists' do
      before do
        @configuration = Klarna.configuration
      end

      it 'returns the existent object' do
        expect(Klarna.configuration).to eq(@configuration)
      end
    end
  end
end

