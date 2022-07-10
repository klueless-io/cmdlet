# frozen_string_literal: true

module Cmdlet
  # Comparison helpers, eg. or, and, equal, not equal, less than, greater than etc.
  module Comparison
    # Default: Return true if **all of** the given values are truthy.
    class Default < Cmdlet::BaseCmdlet
      #
      # @param [Object] values - one or more paramaters that may or may not contain nil
      # @return [String] return true when every value is truthy
      def call(*values)
        default_value = values[-1]

        find_value = values[0..-2].find { |value| !value.nil? }

        find_value || default_value
      end
    end
  end
end
