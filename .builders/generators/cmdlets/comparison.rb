# frozen_string_literal: true

KManager.action :comparison_commands do
  action do
    CmdletDirector
      .init(k_builder, category: :comparison)
      .cmdlet do
        name :and
        description           'Return true if **all of** the given values are truthy.'
        result                'return true when every value is truthy'

        parameter             :values, 'list of values (via *splat) to be checked via AND condition', splat: '*', param_type: 'Object'

        ruby <<-RUBY
          values.all? { |value| value }
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
