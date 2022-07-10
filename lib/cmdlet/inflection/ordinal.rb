# frozen_string_literal: true

module Cmdlet
  # Inflection handling routines, eg. pluralize, singular, ordinalize
  module Inflection
    # Ordinal: The suffix that should be added to a number to denote the position in an ordered sequence such as 1st, 2nd, 3rd, 4th
    class Ordinal < Cmdlet::BaseCmdlet
      #
      # @param [String|Int] value - value - numeric value
      # @return [String] ordinal suffix that would be required for a number
      def call(value)
        return '' if value.nil?

        value = value.to_i if value.is_a? String

        value.ordinal
      end
    end
  end
end
