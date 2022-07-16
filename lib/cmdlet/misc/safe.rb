# frozen_string_literal: true

module Cmdlet
  # Miscellaneous cmdlets
  module Misc
    # Safe: pass through the value with &lt;&gt; and single and double quotes left as is
    class Safe < Cmdlet::BaseCmdlet
      #
      # @param [String|Int] value - value to pass through
      # @return [String] the value with &lt;&gt; and single and double quotes left as is
      def call(value)
        value = '' if value.nil?
        value
      end
    end
  end
end
