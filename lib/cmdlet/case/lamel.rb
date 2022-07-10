# frozen_string_literal: true

module Cmdlet
  # Tokenize and apply case and/or separator
  module Case
    # Lamel: Lower camel case the characters in the given &#x27;string&#x27;
    class Lamel < Cmdlet::BaseCmdlet
      #
      # @param [String|Int] value - value - to be converted
      # @return [String] value converted to lower camel case
      def call(value)
        tokenizer.parse(value, separator: '_').camelize(:lower)
      end
    end
  end
end
