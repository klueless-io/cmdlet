# frozen_string_literal: true

{{#each cmdlets}}
require_relative 'handlebarsjs/helpers/{{category}}/{{name}}'
{{/each}}
