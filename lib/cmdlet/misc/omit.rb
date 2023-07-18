# frozen_string_literal: true

module Cmdlet
  # Miscellaneous cmdlets
  module Misc
    # Omit: this content will not get written out, useful for commenting out code
    class Omit < Cmdlet::BaseCmdlet
      #
      # @param [String|Int] value - value to omit
      # @return [String] empty stting
      def call(_value)
        ''
      end
    end
  end
end
