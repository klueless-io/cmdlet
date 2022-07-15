# frozen_string_literal: true

module Handlebarsjs
  # Pre-configure default helpers for each category
  class HandlebarsConfigurationDefaults
    def add_all_defaults
      {{#each cmdlet_categories}}
      add_{{category}}_defaults
      {{/each}}
    end

    {{#each cmdlet_categories}}
    def add_{{category}}_defaults
      KConfig.configure do |config|
      {{#each cmdlets}}
        config.handlebars.helper(:{{name}}, Handlebarsjs::Helpers::{{camel category}}::{{camel name}}.new{{#if aliases}}, aliases: %i[{{#each aliases}}{{#if @first}}{{^}} {{/if}}{{.}}{{/each}}]{{/if}})
{{/each}}
      end
    end

    {{/each}}
  end
end
