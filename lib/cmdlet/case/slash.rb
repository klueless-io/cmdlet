# frozen_string_literal: true

module Cmdlet
  # Tokenize and apply case and/or separator
  module Case
    # Slash: Slash case the characters in the given &#x27;string&#x27;
    class Slash < Cmdlet::BaseCmdlet
      #
      # @param [String|Int] value - value - to be converted
      # @return [String] value converted to slash case
      def call(value)
        tokenizer.parse(value, preserve_case: true, separator: '/')
      end
    end
  end
end
