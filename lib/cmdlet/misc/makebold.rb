# frozen_string_literal: true

module Cmdlet
  # Miscellaneous cmdlets
  module Misc
    # Makebold: Sample to bold some text
    class Makebold < Cmdlet::BaseCmdlet
      #
      # @param [Handlebars Block] value - block
      # @return [String] Testing an ID
      def call(_value)
        '<b>Testing an ID</b>'
      end
    end
  end
end
