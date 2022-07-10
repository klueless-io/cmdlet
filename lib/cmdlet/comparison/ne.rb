# frozen_string_literal: true

module Cmdlet
  # Comparison helpers, eg. or, and, equal, not equal, less than, greater than etc.
  module Comparison
    # Ne: Return true if left hand side is NOT equal to right hand side
    class Ne < Cmdlet::BaseCmdlet
      #
      # @param [Object] lhs - lhs - left hand side value
      # @param [Object] rhs - rhs - right hand side value
      # @return [String] truthy value if left hand side is NOT equal to right hand side
      def call(lhs, rhs)
        lhs = lhs.to_s if lhs.is_a?(Symbol)
        rhs = rhs.to_s if rhs.is_a?(Symbol)

        lhs != rhs
      end
    end
  end
end
