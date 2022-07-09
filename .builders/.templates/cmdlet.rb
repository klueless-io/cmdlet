# frozen_string_literal: true

module Cmdlet
  # {{cmdlet.category_description}}
  module {{camel cmdlet.category}}
    # {{camel cmdlet.name}}: {{cmdlet.description}}
    class {{camel cmdlet.name}} < Cmdlet::BaseCmdlet
      {{#each cmdlet.usecases}}
      # @example
      #
      #   puts {{camel ./function}}.new.call({{{nice_inputs}}})
      #
      #   {{expected_output}}
      #
      {{/each}}
      #
      {{#each cmdlet.parameters}}
      # @param [{{./param_type}}] {{./name}} - {{./description}}
      {{/each}}
      # @return [String] {{cmdlet.result}}
      def call({{#each cmdlet.parameters}}{{#if ./splat}}{{./splat}}{{/if}}{{./name}}{{#if ./default}} = {{{./default}}}{{/if}}{{#if @last}}{{^}}, {{/if}}{{/each}})
{{{cmdlet.ruby}}}
      end
    end
  end
end
