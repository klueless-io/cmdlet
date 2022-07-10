# frozen_string_literal: true

module Cmdlet
  # Comparison helpers, eg. or, and, equal, not equal, less than, greater than etc.
  module Comparison
    # Or: Return true if any value is truthy.
    class Or < Cmdlet::BaseCmdlet
      #
      # @param [Object] values - list of values (via *splat) to be checked via AND condition
      # @return [String] return true when first value is truthy
      def call(*values)
        values.any? { |value| value }
      end
    end
  end
end
