# frozen_string_literal: true

module Handlebarsjs
  module Helpers
    # {{cmdlet.category_description}}
    module {{camel cmdlet.category}}
      # {{camel cmdlet.name}}: {{cmdlet.description}}
      class {{camel cmdlet.name}} < Handlebarsjs::BaseHelper
        register_cmdlet(Cmdlet::{{camel cmdlet.category}}::{{camel cmdlet.name}})

        def to_proc
          ->({{#each cmdlet.parameters}}{{#if ./splat}}{{./splat}}{{/if}}{{./name}}{{#if @last}}{{^}}, {{/if}}{{/each}}, _opts) { wrapper(cmdlet.call({{#each cmdlet.parameters}}{{#if ./splat}}{{./splat}}{{/if}}{{./name}}{{#if @last}}{{^}}, {{/if}}{{/each}})) }
        end
      end
    end
  end
end
