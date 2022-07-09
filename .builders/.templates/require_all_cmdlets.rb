# frozen_string_literal: true

{{#each cmdlets}}
require_relative '{{category}}/{{name}}'
{{/each}}
