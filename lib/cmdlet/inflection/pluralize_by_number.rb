# frozen_string_literal: true

module Cmdlet
  # Inflection handling routines, eg. pluralize, singular, ordinalize
  module Inflection
    # PluralizeByNumber: Returns the plural form of the word based on a count
    class PluralizeByNumber < Cmdlet::BaseCmdlet
      #
      # @param [String] value - value - value to pluralize
      # @param [Int] count - count used to determine pluralization
      # @param [String] format - (Optional) what format should output be. :word, :number_word
      # @return [String] value and number are used to calculate plural/singular form
      def call(value, count, format)
        return '' if value.nil?

        count = count.to_i if count.is_a? String
        format = :word if format.nil?

        case format.to_sym
        when :number_word, :number_and_word
          "#{count} #{value.pluralize(count)}"
        else # aka :word
          value.pluralize(count)
        end
      end
    end
  end
end
