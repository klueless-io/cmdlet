# frozen_string_literal: true

KManager.action :case_commands do
  action do
    CmdletDirector
      .init(k_builder, category: :case)
      .cmdlet do
        name :back_slash
        aliases               %i[backward_slash slash_backward]
        description           'Convert to back slash notation'
        result                'value converted to back_slash case'

        parameter             :value, 'value - to be converted', param_type: 'String|Int'

        ruby <<-'RUBY'
          tokenizer.parse(value, preserve_case: true, separator: '\\')
        RUBY
      end
      .cmdlet do
        name :camel
        aliases               %i[camel_upper camelUpper camelU pascalcase]
        description           "Camel case the characters in the given 'string'"
        result                'value converted to camel case'

        parameter             :value, 'value - to be converted', param_type: 'String|Int'

        ruby <<-'RUBY'
          tokenizer.parse(value).underscore.camelize
        RUBY
      end
      .cmdlet do
        name :constant
        aliases               %i[constantize]
        description           "Constant case the characters in the given 'string'"
        result                'value converted to constant case'

        parameter             :value, 'value - to be converted', param_type: 'String|Int'

        ruby <<-'RUBY'
          tokenizer.parse(value, separator: '_').upcase
        RUBY
      end
      .cmdlet do
        name :dash
        aliases               %i[dasherize dashify dashcase hyphenate]
        description           "Dash case the characters in the given 'string'"
        result                'value converted to dash case'

        parameter             :value, 'value - to be converted', param_type: 'String|Int'

        ruby <<-'RUBY'
          tokenizer.parse(value)
        RUBY
      end
      .cmdlet do
        name :dot
        aliases               %i[dotirize dotify dotcase hyphenate]
        description           "Dot case the characters in the given 'string'"
        result                'value converted to dot case'

        parameter             :value, 'value - to be converted', param_type: 'String|Int'

        ruby <<-'RUBY'
          tokenizer.parse(value, separator: '.')
        RUBY
      end
      .cmdlet do
        name :double_colon
        description           "Double colon case the characters in the given 'string'"
        result                'value converted to double_colon case'

        parameter             :value, 'value - to be converted', param_type: 'String|Int'

        ruby <<-'RUBY'
          tokenizer.parse(value, preserve_case: true, separator: '::')
        RUBY
      end
      .cmdlet do
        name :human
        aliases               %i[humanize sentence]
        description           "Human case the characters in the given 'string'"
        result                'value converted to human case'

        parameter             :value, 'value - to be converted', param_type: 'String|Int'

        ruby <<-'RUBY'
          tokenizer.parse(value,
            separator: ' ',
            preserve_case: true,
            compress_prefix_numerals: false,
            compress_suffix_numerals: false).humanize
        RUBY
      end
      .cmdlet do
        name :lamel
        aliases               %i[camel_lower camelLower camelL]
        description           "Lower camel case the characters in the given 'string'"
        result                'value converted to lower camel case'

        parameter             :value, 'value - to be converted', param_type: 'String|Int'

        ruby <<-'RUBY'
          tokenizer.parse(value, separator: '_').camelize(:lower)
        RUBY
      end
      .cmdlet do
        name :lower
        aliases               %i[lowercase downcase]
        description           "Lower case the characters in the given 'string'"
        result                'value converted to lower case'

        parameter             :value, 'value - to be converted', param_type: 'String|Int'

        ruby <<-'RUBY'
          return '' if value.nil?

          value.downcase
        RUBY
      end
      .cmdlet do
        name :slash
        aliases               %i[forward_slash slash_forward]
        description           "Slash case the characters in the given 'string'"
        result                'value converted to slash case'

        parameter             :value, 'value - to be converted', param_type: 'String|Int'

        ruby <<-'RUBY'
          tokenizer.parse(value, preserve_case: true, separator: '/')
        RUBY
      end
      .cmdlet do
        name :snake
        description           "Snake case the characters in the given 'string'"
        result                'value converted to snake case'

        parameter             :value, 'value - to be converted', param_type: 'String|Int'

        ruby <<-'RUBY'
          tokenizer.parse(value, separator: '_', forced_separator: true)
        RUBY
      end
      .cmdlet do
        name :title
        aliases               %i[titleize]
        description           "Title case the characters in the given 'string'"
        result                'value converted to title case'

        parameter             :value, 'value - to be converted', param_type: 'String|Int'

        ruby <<-'RUBY'
        tokenizer.parse(value,
          separator: ' ',
          preserve_case: true,
          compress_prefix_numerals: false,
          compress_suffix_numerals: false)
        .titleize
      RUBY
      end
      .cmdlet do
        name :upper
        aliases               %i[upcase uppercase]
        description           "Upper case the characters in the given 'string'"
        result                'value converted to upper case'

        parameter             :value, 'value - to be converted', param_type: 'String|Int'

        ruby <<-'RUBY'
          return '' if value.nil?

          value.upcase
        RUBY
      end
      .generate
      .debug
  end
end

# format_as
# upper
