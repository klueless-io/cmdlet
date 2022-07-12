# frozen_string_literal: true

KManager.action :inflection_commands do
  action do
    CmdletDirector
      .init(k_builder, category: :inflection)
      .cmdlet do
        name :ordinal
        description           'The suffix that should be added to a number to denote the position in an ordered sequence such as 1st, 2nd, 3rd, 4th'
        result                'ordinal suffix that would be required for a number'

        parameter             :value, 'value - numeric value', param_type: 'String|Int'

        ruby <<-RUBY
          return '' if value.nil?

          value = value.to_i if value.is_a? String

          value.ordinal
        RUBY
      end
      .cmdlet do
        name :ordinalize
        description           'Turns a number into an ordinal string used to denote the position in an ordered sequence such as 1st, 2nd, 3rd, 4th.'
        result                'number value turned to 1st, 2nd, 3rd, 4th etc.'

        parameter             :value, 'value - numeric value', param_type: 'Int'

        ruby <<-RUBY
          return '' if value.nil?

          value = value.to_i if value.is_a? String

          value.ordinalize
        RUBY
      end
      .cmdlet do
        name :pluralize
        description           'Returns the plural form of the word in the string'
        result                'value in plural form'

        parameter             :value, 'value - value to pluralize', param_type: 'String'

        ruby <<-RUBY
          return '' if value.nil?

          value = value.to_s if value.is_a?(Symbol)

          value.pluralize
        RUBY
      end
      .cmdlet do
        name :pluralize_number
        description           'Returns the plural form of the word based on a count in the format "categories"'
        result                'value and number are used to calculate plural/singular form'

        parameter             :value, 'value - value to pluralize', param_type: 'String'
        parameter             :count, 'count used to determine pluralization', param_type: 'Int'
        
        ruby <<-'RUBY'
          return '' if value.nil?

          count = count.to_i if count.is_a? String

          value.pluralize(count)
        RUBY
      end
      .cmdlet do
        name :pluralize_number_word
        description           'Returns the plural form of the word based on a count with the count prefixed in the format "3 categories"'
        result                'value and number are used to calculate plural/singular form'

        parameter             :value, 'value - value to pluralize', param_type: 'String'
        parameter             :count, 'count used to determine pluralization', param_type: 'Int'

        ruby <<-'RUBY'
          return '' if value.nil?

          count = count.to_i if count.is_a? String

          "#{count} #{value.pluralize(count)}"
        RUBY
      end
      .cmdlet do
        name :singularize
        description           'The reverse of #pluralize, returns the singular form of a word in a string'
        result                'plural value turned to singular value'

        parameter             :value, 'value - value to singularized', param_type: 'String'

        ruby <<-RUBY
          return '' if value.nil?

          value = value.to_s if value.is_a?(Symbol)

          value.singularize
        RUBY
      end
      .generate
      .debug
  end
end
