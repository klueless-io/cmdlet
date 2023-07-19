# frozen_string_literal: true

KManager.action :misc_commands do
  action do
    CmdletDirector
      .init(k_builder, category: :misc)
      .cmdlet do
        name :safe
        description           'pass through the value with <> and single and double quotes left as is'
        result                'the value with <> and single and double quotes left as is'

        parameter             :value, 'value to pass through', param_type: 'String|Int'

        ruby <<-RUBY
          value = '' if value.nil?
          value
        RUBY
      end
      .cmdlet do
        name :omit
        aliases               %i[ignore comment_out]
        description           'this content will not get written out, useful for commenting out code'
        result                'empty string'

        parameter             :value, 'value to omit', param_type: 'String|Int'

        ruby <<-RUBY
          ''
        RUBY
      end
      .cmdlet do
        name :makebold
        description           'Sample to bold some text'
        result                'Testing an ID'

        parameter             :value, 'block', param_type: 'Handlebars Block'

        ruby <<-RUBY
          "<b>Testing an ID</b>"
        RUBY
      end
      .cmdlet do
        name :format_json
        description           'FormatJson will take an object and write it out as pretty JSON'
        result                'value as pretty JSON string'

        parameter             :value, 'object to be converted to JSON string', param_type: 'Object'

        ruby <<-RUBY
          return '{}' if value.nil?

          value = JSON.pretty_generate(value)

          value
        RUBY
      end
      .generate
      # .debug
  end
end
