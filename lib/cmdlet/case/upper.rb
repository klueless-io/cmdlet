# frozen_string_literal: true

module Cmdlet
  # Tokenize and apply case and/or separator
  module Case
    # Upper: Upper case the characters in the given &#x27;string&#x27;
    class Upper < Cmdlet::BaseCmdlet
      #
      # @param [String|Int] value - value - to be converted
      # @return [String] value converted to upper case
      def call(value)
        return '' if value.nil?

        value.upcase
      end
    end
  end
end
