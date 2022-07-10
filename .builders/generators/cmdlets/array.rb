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
      .debug
  end
end

# result                "return block when every value is truthy"

# parameter('values', 'list of values (via *splat) to be checked via AND condition', splat: true)

# example <<-TEXT
#   {{#if (and p1 p2 p3 p4 p5)}}
#     found
#   {{/if}}
# TEXT

# example <<-TEXT
#   {{#if (and name age)}}
#     {{name}}-{{age}}
#   {{else}}
#     no name or age
#   {{/if}}
# TEXT

# builder
#   .add_file('FUNCTIONS.md',
#             template_file: 'FUNCTIONS.md',
#             categories: categories.sort_by { |r| r.name },
#             functions: functions.sort_by { |r| [r.category, r.name] },
#             on_exist: :write)

# add('all_commands.rb',
#     template_file: 'all_commands.rb',
#     commands: commands.sort_by { |r| [r.category, r.name] },
#     on_exist: :write)

# cmdlets.each do |cmdlet|

#   add("#{cmdlet.category}/#{cmdlet.name}.rb",
#                     cmdlet: cmdlet,
#                     template_file: 'command.rb',
#                     on_exist: :write)
# end
