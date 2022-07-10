# frozen_string_literal: true

module Cmdlet
  # Tokenize and apply case and/or separator
  module Case
    # Lower: Lower case the characters in the given &#x27;string&#x27;
    class Lower < Cmdlet::BaseCmdlet
      #
      # @param [String|Int] value - value - to be converted
      # @return [String] value converted to lower case
      def call(value)
        return '' if value.nil?

        value.downcase
      end
    end
  end
end
