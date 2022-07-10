# frozen_string_literal: true

module Cmdlet
  # Tokenize and apply case and/or separator
  module Case
    # Dot: Dot case the characters in the given &#x27;string&#x27;
    class Dot < Cmdlet::BaseCmdlet
      #
      # @param [String|Int] value - value - to be converted
      # @return [String] value converted to dot case
      def call(value)
        tokenizer.parse(value, separator: '.')
      end
    end
  end
end
