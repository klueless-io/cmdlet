# frozen_string_literal: true

module Cmdlet
  # Tokenize and apply case and/or separator
  module Case
    # Camel: Camel case the characters in the given &#x27;string&#x27;
    class Camel < Cmdlet::BaseCmdlet
      #
      # @param [String|Int] value - value - to be converted
      # @return [String] value converted to camel case
      def call(value)
        tokenizer.parse(value).underscore.camelize
      end
    end
  end
end
