# frozen_string_literal: true

module Cmdlet
  # Inflection handling routines, eg. pluralize, singular, ordinalize
  module Inflection
    # Ordinalize: Turns a number into an ordinal string used to denote the position in an ordered sequence such as 1st, 2nd, 3rd, 4th.
    class Ordinalize < Cmdlet::BaseCmdlet
      #
      # @param [Int] value - value - numeric value
      # @return [String] number value turned to 1st, 2nd, 3rd, 4th etc.
      def call(value)
        return '' if value.nil?

        value = value.to_i if value.is_a? String

        value.ordinalize
      end
    end
  end
end
