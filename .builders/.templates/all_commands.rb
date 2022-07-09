# frozen_string_literal: true

{{#each commands}}
require 'cmdlet/{{category}}/{{name}}'
{{/each}}
