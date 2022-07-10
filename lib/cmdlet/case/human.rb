# frozen_string_literal: true

module Cmdlet
  # Tokenize and apply case and/or separator
  module Case
    # Human: Human case the characters in the given &#x27;string&#x27;
    class Human < Cmdlet::BaseCmdlet
      #
      # @param [String|Int] value - value - to be converted
      # @return [String] value converted to human case
      def call(value)
        tokenizer.parse(value,
                        separator: ' ',
                        preserve_case: true,
                        compress_prefix_numerals: false,
                        compress_suffix_numerals: false).humanize
      end
    end
  end
end
