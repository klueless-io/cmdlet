# frozen_string_literal: true

module Cmdlet
  # Miscellaneous cmdlets
  module Misc
    # FormatJson: FormatJson will take an object and write it out as pretty JSON
    class FormatJson < Cmdlet::BaseCmdlet
      #
      # @param [Object] value - object to be converted to JSON string
      # @return [String] value as pretty JSON string
      def call(value)
        return '{}' if value.nil?

        JSON.pretty_generate(value)
      end
    end
  end
end
