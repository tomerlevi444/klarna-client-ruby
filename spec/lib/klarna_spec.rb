require 'spec_helper'

describe Klarna do
  describe '.configure' do
    context 'given a configuration block' do
      before do
        setup_configuration('kred.test.machine', 443, 1, 'supersecret')
      end

      it 'returns "kred.test.machine" for hostname' do
        expect(Klarna.configuration.hostname).to eq('kred.test.machine')
      end

      it 'returns 443 for port' do
        expect(Klarna.configuration.port).to eq(443)
      end

      it 'returns 1 for store_id' do
        expect(Klarna.configuration.store_id).to eq(1)
      end

      it 'returns "supersecret" for store_secret' do
        expect(Klarna.configuration.store_secret).to eq('supersecret')
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

