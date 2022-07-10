# frozen_string_literal: true

module Cmdlet
  # Tokenize and apply case and/or separator
  module Case
    # Dash: Dash case the characters in the given &#x27;string&#x27;
    class Dash < Cmdlet::BaseCmdlet
      #
      # @param [String|Int] value - value - to be converted
      # @return [String] value converted to dash case
      def call(value)
        tokenizer.parse(value)
      end
    end
  end
end
