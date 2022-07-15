# frozen_string_literal: true

module Cmdlet
  # Miscellaneous cmdlets
  module Misc
    # Safe: pass through the value with &lt;&gt; and single and double quotes left as is
    class Safe < Cmdlet::BaseCmdlet
      #
      # @param [String|Int] values - valure to pass throught
      # @return [String] the value with &lt;&gt; and single and double quotes left as is
      def call(_values)
        value = '' if value.nil?
        value
      end
    end
  end
end
