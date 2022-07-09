# frozen_string_literal: true

# reference: https://github.com/rails/rails/blob/master/activesupport/lib/active_support/inflector/methods.rb

module Cmdlet
  # {{cmdlet.category_description}}
  module {{camel cmdlet.category}}
    # {{camel cmdlet.name}}: {{cmdlet.command_description}}
    class {{camel cmdlet.name}} < Funcky::BaseFunction
      {{#each cmdlet.usecases}}
      # @example
      #
      #   puts {{camel ./function}}.new.parse({{{nice_inputs}}})
      #
      #   {{expected_output}}
      #
      {{/each}}
      #
      # @param [String|Int] value - numeric value
      # @return [String] ordinal suffix that would be required for a number
      def parse(value)
{{{cmdlet.ruby}}}
      end
    end
  end
end
