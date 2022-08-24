# frozen_string_literal: true

module Cmdlet
  # String manipulation
  module Str
    # Padr: take the value and give it padding on the right hand side
    class Padr < Cmdlet::BaseCmdlet
      #
      # @param [String|Symbol|Int] value - value to apply padding to
      # @param [Int] count - how much padding to apply. defaults to configuration.padr_count
      # @param [String] char - character to pad with. defaults to configuration.padr_char
      # @return [String] the value padded on RHS with [char (default &#x27; &#x27;)] and [count (default 30)]
      def call(value, count = nil, char = nil)
        value = '' if value.nil?
        count = KConfig.configuration.cmdlet.padr_count if count.nil?
        count = count.to_i if count.is_a?(String)
        char = KConfig.configuration.cmdlet.padr_char if char.nil?
        value.to_s.ljust(count, char)
      end
    end
  end
end
