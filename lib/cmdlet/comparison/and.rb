# frozen_string_literal: true

module Cmdlet
  # Comparison helpers, eg. or, and, equal, not equal, less than, greater than etc.
  module Comparison
    # And: Return true if **all of** the given values are truthy.
    class And < Cmdlet::BaseCmdlet
      #
      # @param [Object] values - list of values (via *splat) to be checked via AND condition
      # @return [String] return true when every value is truthy
      def call(*values)
        return false if values.nil? || values.length.zero?

        values.all? { |value| value }
      end
    end
  end
end
