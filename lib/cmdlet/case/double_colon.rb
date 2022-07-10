# frozen_string_literal: true

module Cmdlet
  # Tokenize and apply case and/or separator
  module Case
    # DoubleColon: Double colon case the characters in the given &#x27;string&#x27;
    class DoubleColon < Cmdlet::BaseCmdlet
      #
      # @param [String|Int] value - value - to be converted
      # @return [String] value converted to double_colon case
      def call(value)
        tokenizer.parse(value, preserve_case: true, separator: '::')
      end
    end
  end
end
