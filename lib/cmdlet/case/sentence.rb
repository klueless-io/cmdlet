# frozen_string_literal: true

module Cmdlet
  # Tokenize and apply case and/or separator
  module Case
    # Sentence: Sentence case the characters in the given &#x27;string&#x27;
    class Sentence < Cmdlet::BaseCmdlet
      #
      # @param [String|Int] value - value - to be converted
      # @return [String] value converted to sentence case
      def call(value)
        tokenizer.parse(value,
                        separator: ' ',
                        preserve_case: true,
                        compress_prefix_numerals: false,
                        compress_suffix_numerals: false).titleize
      end
    end
  end
end
