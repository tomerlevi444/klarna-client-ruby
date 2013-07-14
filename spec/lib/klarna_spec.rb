require 'spec_helper'

describe Klarna do
  describe '.configure' do
    it 'accepts a block'
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

