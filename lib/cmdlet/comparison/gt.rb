# frozen_string_literal: true

module Cmdlet
  # Comparison helpers, eg. or, and, equal, not equal, less than, greater than etc.
  module Comparison
    # Gt: Return true if left hand side GREATER THAN right hand side
    class Gt < Cmdlet::BaseCmdlet
      #
      # @param [Object] lhs - lhs - left hand side value
      # @param [Object] rhs - rhs - right hand side value
      # @return [String] truthy value if left hand side GREATER THAN right hand side
      def call(lhs, rhs)
        lhs > rhs
      end
    end
  end
end
