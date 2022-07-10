# frozen_string_literal: true

module Cmdlet
  # Inflection handling routines, eg. pluralize, singular, ordinalize
  module Inflection
    # Singularize: The reverse of #pluralize, returns the singular form of a word in a string
    class Singularize < Cmdlet::BaseCmdlet
      #
      # @param [String] value - value - value to singularized
      # @return [String] plural value turned to singular value
      def call(value)
        return '' if value.nil?

        value = value.to_s if value.is_a?(Symbol)

        value.singularize
      end
    end
  end
end
