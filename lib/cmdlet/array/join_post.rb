# frozen_string_literal: true

module Cmdlet
  # Array handling routines, eg. join, join_prefix, join_post
  module Array
    # JoinPost: join an array of values with separator as a string and using the separator at the end of string
    class JoinPost < Funcky::BaseFunction
      #
      # @param [String|Int] values - array of values to join
      # @param [String] separator - separator between values, defaults to comma
      # @return [String]
      def parse(values, separator = ',')
        return '' if values.nil? || !values.is_a?(Array)

        values = values.reject(&:blank?)
        return '' if values.length.zero?

        "#{values.join(separator)}#{separator}"
      end
    end
  end
end
