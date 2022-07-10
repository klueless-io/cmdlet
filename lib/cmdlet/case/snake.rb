# frozen_string_literal: true

module Cmdlet
  # Tokenize and apply case and/or separator
  module Case
    # Snake: Snake case the characters in the given &#x27;string&#x27;
    class Snake < Cmdlet::BaseCmdlet
      #
      # @param [String|Int] value - value - to be converted
      # @return [String] value converted to snake case
      def call(value)
        tokenizer.parse(value, separator: '_', forced_separator: true)
      end
    end
  end
end
