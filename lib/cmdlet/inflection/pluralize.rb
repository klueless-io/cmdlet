# frozen_string_literal: true

module Cmdlet
  # Inflection handling routines, eg. pluralize, singular, ordinalize
  module Inflection
    # Pluralize: Returns the plural form of the word in the string
    class Pluralize < Cmdlet::BaseCmdlet
      #
      # @param [String] value - value - value to pluralize
      # @return [String] value in plural form
      def call(value)
        return '' if value.nil?

        value = value.to_s if value.is_a?(Symbol)

        value.pluralize
      end
    end
  end
end
