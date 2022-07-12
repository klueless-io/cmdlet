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
      .cmdlet do
        name :default
        description           'Return true if **all of** the given values are truthy.'
        result                'return true when every value is truthy'

        parameter             :values, 'one or more paramaters that may or may not contain nil', splat: '*', param_type: 'Object'

        ruby <<-RUBY
          default_value = values[-1]

          find_value = values[0..-2].find { |value| !value.nil? }

          find_value || default_value
        RUBY

      end
      .cmdlet do
        name :eq
        description           'Return true if two values are equal'
        result                'return truthy value if left hand side equals right hand side'

        parameter             :lhs, 'lhs - left hand side value', param_type: 'Object'
        parameter             :rhs, 'rhs - right hand side value', param_type: 'Object'

        ruby <<-RUBY
          lhs = lhs.to_s if lhs.is_a?(Symbol)
          rhs = rhs.to_s if rhs.is_a?(Symbol)

          lhs == rhs
        RUBY
      end
      .cmdlet do
        name :gt
        description           'Return true if left hand side GREATER THAN right hand side'
        result                'truthy value if left hand side GREATER THAN right hand side'

        parameter             :lhs, 'lhs - left hand side value', param_type: 'Object'
        parameter             :rhs, 'rhs - right hand side value', param_type: 'Object'

        ruby <<-RUBY
          lhs > rhs
        RUBY
      end
      .cmdlet do
        name :gte
        description           'Return true if left hand side GREATER THAN or EQUAL TO right hand side'
        result                'truthy value if left hand side GREATER THAN or EQUAL TO  right hand side'

        parameter             :lhs, 'lhs - left hand side value', param_type: 'Object'
        parameter             :rhs, 'rhs - right hand side value', param_type: 'Object'

        ruby <<-RUBY
          lhs >= rhs
        RUBY
      end
      .cmdlet do
        name :lt
        description           'Return true if left hand side LESS THAN right hand side'
        result                'truthy value if left hand side LESS THAN right hand side'

        parameter             :lhs, 'lhs - left hand side value', param_type: 'Object'
        parameter             :rhs, 'rhs - right hand side value', param_type: 'Object'

        ruby <<-RUBY
          lhs < rhs
        RUBY
      end
      .cmdlet do
        name :lte
        description           'Return true if left hand side LESS THAN or EQUAL TO right hand side'
        result                'truthy value if left hand side LESS THAN or EQUAL TO  right hand side'

        parameter             :lhs, 'lhs - left hand side value', param_type: 'Object'
        parameter             :rhs, 'rhs - right hand side value', param_type: 'Object'

        ruby <<-RUBY
          lhs <= rhs
        RUBY
      end
      .cmdlet do
        name :ne
        description           'Return true if left hand side is NOT equal to right hand side'
        result                'truthy value if left hand side is NOT equal to right hand side'

        parameter             :lhs, 'lhs - left hand side value', param_type: 'Object'
        parameter             :rhs, 'rhs - right hand side value', param_type: 'Object'

        ruby <<-RUBY
          lhs = lhs.to_s if lhs.is_a?(Symbol)
          rhs = rhs.to_s if rhs.is_a?(Symbol)

          lhs != rhs
        RUBY
      end
      .cmdlet do
        name :or
        description           'Return true if any value is truthy.'
        result                'return true when first value is truthy'

        parameter             :values, 'list of values (via *splat) to be checked via AND condition', splat: '*', param_type: 'Object'

        ruby <<-RUBY
          values.any? { |value| value }
        RUBY
      end
    .generate
    .debug
  end
end