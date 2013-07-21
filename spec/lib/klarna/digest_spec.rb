require 'spec_helper'

describe Klarna::Digest do
  describe '.for' do
    context 'given an array of shit' do
      let(:array) { [1,'foo', :bar] }

      it 'returns the right disgest' do
        expect(Klarna::Digest.for(array)).to eq('+mhT3NFF3HrvsBledhMRa98+H+1ES5JSVzL8YoWGr8LHosHgtqY2kJJ5fRHYI7AEKAig7EaanDv9ZGyHXTN8Kw==')
      end
    end
  end
end
