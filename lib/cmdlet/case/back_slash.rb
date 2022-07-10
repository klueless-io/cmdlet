# frozen_string_literal: true

module Cmdlet
  # Tokenize and apply case and/or separator
  module Case
    # BackSlash: Convert to back slash notation
    class BackSlash < Cmdlet::BaseCmdlet
      #
      # @param [String|Int] value - value - to be converted
      # @return [String] value converted to back_slash case
      def call(value)
        tokenizer.parse(value, preserve_case: true, separator: '\\')
      end
    end
  end
end
