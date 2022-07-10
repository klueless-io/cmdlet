# frozen_string_literal: true

module Cmdlet
  # Array handling routines, eg. join, join_prefix, join_post
  module Array
    # JoinPre: join an array of values with separator as a string and using the separator at the beginning of string
    class JoinPre < Cmdlet::BaseCmdlet
      #
      # @param [String|Int] values - array of values to join
      # @param [String] separator - separator between values, defaults to comma
      # @return [String]
      def call(values, separator = ',')
        return false if values.nil? || values.length.zero?

        values = values.reject(&:blank?)
        return '' if values.length.zero?

        "#{separator}#{values.join(separator)}"
      end
    end
  end
end
