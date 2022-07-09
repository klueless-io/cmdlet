# frozen_string_literal: true

module Cmdlet
  # {{cmdlet.category_description}}
  module {{camel cmdlet.category}}
    # {{camel cmdlet.name}}: {{cmdlet.description}}
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
      {{#each cmdlet.parameters}}
      # @param [{{./param_type}}] {{./name}} - {{./description}}
      {{/each}}
      # @return [String] {{cmdlet.result}}
      def parse({{#each cmdlet.parameters}}{{./name}}{{#if ./default}} = {{{./default}}}{{/if}}{{#if @last}}{{^}}, {{/if}}{{/each}})
{{{cmdlet.ruby}}}
      end
    end
  end
end
