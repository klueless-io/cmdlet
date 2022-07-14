# frozen_string_literal: true

KManager.action :array_commands do
  action do
    CmdletDirector
      .init(k_builder, category: :array)
      .cmdlet do
        name :join
        description           'join an array of values with separator as a string'
        result                'new String formed by joining the array elements with seperator'

        parameter             :values, 'array of values to join', param_type: 'String|Int'
        parameter             :separator, 'separator between values, defaults to comma', default: "','"

        ruby <<-RUBY
          return false if values.nil? || values.length == 0
          values = values.reject(&:blank?)
          return '' if values.length.zero?

          values.join(separator)
        RUBY
      end
      .cmdlet do
        name :join_pre
        description           'join an array of values with separator as a string and using the separator at the beginning of string'

        parameter             :values, 'array of values to join', param_type: 'String|Int'
        parameter             :separator, 'separator between values, defaults to comma', default: "','"

        ruby <<-'RUBY'
          return '' if values.nil? || !values.is_a?(::Array)
          values = values.reject(&:blank?)
          return '' if values.length.zero?

          "#{separator}#{values.join(separator)}"
        RUBY
      end
      .cmdlet do
        name :join_post
        description           'join an array of values with separator as a string and using the separator at the end of string'

        parameter             :values, 'array of values to join', param_type: 'String|Int'
        parameter             :separator, 'separator between values, defaults to comma', default: "','"

        ruby <<-'RUBY'
            return '' if values.nil? || !values.is_a?(::Array)
            values = values.reject(&:blank?)
            return '' if values.length.zero?

            "#{values.join(separator)}#{separator}"
        RUBY
      end
      .generate
      # .debug
  end
end
