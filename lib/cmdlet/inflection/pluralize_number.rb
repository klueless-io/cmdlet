# frozen_string_literal: true

module Cmdlet
  # Inflection handling routines, eg. pluralize, singular, ordinalize
  module Inflection
    # PluralizeNumber: Returns the plural form of the word based on a count in the format &quot;categories&quot;
    class PluralizeNumber < Cmdlet::BaseCmdlet
      #
      # @param [String] value - value - value to pluralize
      # @param [Int] count - count used to determine pluralization
      # @return [String] value and number are used to calculate plural/singular form
      def call(value, count)
        return '' if value.nil?

        count = count.to_i if count.is_a? String

        value.pluralize(count)
      end
    end
  end
end
