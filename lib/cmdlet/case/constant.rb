# frozen_string_literal: true

module Cmdlet
  # Tokenize and apply case and/or separator
  module Case
    # Constant: Constant case the characters in the given &#x27;string&#x27;
    class Constant < Cmdlet::BaseCmdlet
      #
      # @param [String|Int] value - value - to be converted
      # @return [String] value converted to constant case
      def call(value)
        tokenizer.parse(value, separator: '_').upcase
      end
    end
  end
end
