require 'digest'

module Klarna
  class Digest
    def self.for(array)
      message = array.join(':')

      ::Digest::SHA512.base64digest(message)
    end
  end
end
