# frozen_string_literal: true

module Cmdlet
  # String manipulation
  module Str
    # Padl: take the value and give it padding on the left hand side
    class Padl < Cmdlet::BaseCmdlet
      #
      # @param [String|Symbol|Int] value - value to apply padding to
      # @param [Int] count - how much padding to apply. defaults to configuration.padl_count
      # @param [String] char - character to pad with. defaults to configuration.padl_char
      # @return [String] the value padded on LHS with [char (default &#x27; &#x27;)] and [count (default 30)]
      def call(value, count = nil, char = nil)
        value = '' if value.nil?
        count = KConfig.configuration.cmdlet.padl_count if count.nil?
        count = count.to_i if count.is_a?(String)
        char = KConfig.configuration.cmdlet.padl_char if char.nil?
        value.to_s.rjust(count, char)
      end
    end
  end
end
