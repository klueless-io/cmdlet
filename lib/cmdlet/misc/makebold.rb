# frozen_string_literal: true

module Cmdlet
  # Miscellaneous cmdlets
  module Misc
    # Makebold: Sample to bold some text
    class Makebold < Cmdlet::BaseCmdlet
      #
      # @param [Handlebars Block] value - block
      # @return [String] Testing an ID
      def call(value)
        "<b>#{value}</b>"
      end
    end
  end
end
