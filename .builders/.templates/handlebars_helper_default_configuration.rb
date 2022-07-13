# frozen_string_literal: true

KConfig.configure do |config|
{{#each cmdlets}}
  config.handlebars.helper(:{{name}}, Handlebarsjs::Helpers::{{camel category}}::{{camel name}}.new)
{{/each}}
end
