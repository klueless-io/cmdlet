def functions
  return @functions unless @functions.nil?
  
  result = KDoc.model :document do
    table :rows do
      fields :category, :name, :alias, :description, :ruby # , f(name: :params, default: [:value])

      # context 'when array of string' do
      #   let(:value) { %w[the quick fox] }

      #   it { is_expected.to eq('the,quick,fox') }
      # end

      # context 'when array of numbers' do
      #   let(:value) { [1, 2, 3] }

      #   it { is_expected.to eq('1,2,3') }
      # end

      # context 'when array of symbol' do
      #   let(:value) { %i[the quick fox] }

      #   it { is_expected.to eq('the,quick,fox') }
      # end

      row :a_array                , :join            , []    , "join an array of values with separator as a string", <<-'RUBY'
        return '' if value.nil? || !value.is_a?(Array)
        values = value.reject(&:blank?)
        return '' if value.length.zero?

        separator = ','
        value.join(separator)
      RUBY

      row :a_array                , :join_pre        , []    , "join an array of values with separator as a string and using the separator at the beginning of string", <<-'RUBY'
        return '' if value.nil? || !value.is_a?(Array)
        values = value.reject(&:blank?)
        return '' if value.length.zero?

        separator = ','
        "#{separator}#{value.join(separator)}"
      RUBY

      row :a_array                , :join_post       , []    , "join an array of values with separator as a string and using the separator at the end of string", <<-'RUBY'
        return '' if value.nil? || !value.is_a?(Array)
        values = value.reject(&:blank?)
        return '' if value.length.zero?

        separator = ','
        "#{value.join(separator)}#{separator}"
      RUBY

      row :a_transform            , :backslash            , [:back_slash]                    , "convert to back slash notation", <<-'RUBY'
        tokenizer.parse(value, preserve_case: true, separator: '\\')
      RUBY

      row :a_transform            , :camel                , [:upper_camel, :pascal]          , "convert to camel notation", <<-'RUBY'
        tokenizer.parse(value).underscore.camelize
      RUBY

      row :a_transform            , :constant             , [:constantize]                   , "", <<-'RUBY'
        tokenizer.parse(value, separator: '_').upcase      
      RUBY

      row :a_transform            , :dash                 , [:dasherize]                     , "convert to dash notation", <<-'RUBY'
        tokenizer.parse(value)
      RUBY

      row :a_transform            , :dot                  , [:dotirize]                      , "", <<-'RUBY'
        tokenizer.parse(value, separator: '.')
      RUBY

      row :a_transform            , :double_colon         , []                               , "", <<-'RUBY'
        tokenizer.parse(value, preserve_case: true, separator: '::')
      RUBY

      row :a_transform            , :lower                , [:lowercase, :downcase]          , "", <<-'RUBY'
        return '' if value.nil?

        value.downcase
      RUBY

      # row :a_transform            , :format_as            , []                               , "", <<-'RUBY'
      
      # RUBY

      row :a_transform            , :proper            , []                               , "Proper case capitalizes the first letter of ALL words in a string", <<-'RUBY'
      tokenizer.parse(value,
              separator: ' ',
              preserve_case: true,
              compress_prefix_numerals: false,
              compress_suffix_numerals: false)
        .titleize
      RUBY

      row :a_transform            , :sentence             , [:human, :humanize]              , "Upper case for first letter only.  Numbers will maintain their spacing", <<-'RUBY'
        tokenizer.parse(value,
                        separator: ' ',
                        preserve_case: true,
                        compress_prefix_numerals: false,
                        compress_suffix_numerals: false)
                  .humanize
      RUBY

      row :a_transform            , :lamel                , [:lower_camel]                   , "", <<-'RUBY'
        tokenizer.parse(value, separator: '_').camelize(:lower)
      RUBY

      row :a_transform            , :slash                , [:forwardslash, :forward_slash]  , "", <<-'RUBY'
        tokenizer.parse(value, preserve_case: true, separator: '/')
      RUBY

      row :a_transform            , :snake                , [:snake]                         , "", <<-'RUBY'
        tokenizer.parse(value, separator: '_', forced_separator: true)
      RUBY

      row :a_transform            , :title                , [:titleize]                      , "", <<-'RUBY'
        tokenizer.parse(value,
                        separator: ' ',
                        preserve_case: true,
                        compress_prefix_numerals: false,
                        compress_suffix_numerals: false)
                 .titleize
      RUBY

      row :a_transform            , :upper                , [:upper_case, :upcase]           , "", <<-'RUBY'
        return '' if value.nil?

        value.upcase
      RUBY

  
      row :a_comparison         , :and                  , [:all] , "", <<-'RUBY'
        values.all? { |value| value }
      RUBY

      # DEFAULT does not make sense in comparison
      row :a_comparison         , :default              , [:fallback] , "", <<-'RUBY'
        default_value = values[-1]

        find_value = values[0..-2].find { |value| !value.nil? }

        find_value || default_value
      RUBY

      row :a_comparison         , :eq                   , [:equal] , "", <<-'RUBY'
        lhs = lhs.to_s if lhs.is_a?(Symbol)
        rhs = rhs.to_s if rhs.is_a?(Symbol)

        lhs == rhs
      RUBY

      row :a_comparison         , :gt                   , [] , "", <<-'RUBY'
        lhs > rhs
      RUBY

      row :a_comparison         , :gte                  , [] , "", <<-'RUBY'
        lhs >= rhs
      RUBY

      row :a_comparison         , :lt                   , [:less_than] , "# Lt: (less than) Block helper that renders a block if `a` is **less than** `b`. If an inverse block is specified it will be rendered when falsy.", <<-'RUBY'
        lhs < rhs
      RUBY

      row :a_comparison         , :lte                  , [:less_than_or_equal_to] , "# Lte: (less than or equal to) Block helper that renders a block if `a` is **less than or equal to** `b`. If an inverse block is specified it will be rendered when falsy.", <<-'RUBY'
        lhs <= rhs
      RUBY

      row :a_comparison         , :ne                   , [:not_equal] , "# Ne: (not equal) Block helper that renders a block if `a` is **not equal to** `b`. If an inverse block is specified it will be rendered when falsy.", <<-'RUBY'
        lhs = lhs.to_s if lhs.is_a?(Symbol)
        rhs = rhs.to_s if rhs.is_a?(Symbol)

        lhs != rhs
      RUBY

      row :a_comparison         , :or                   , [:any] , "", <<-'RUBY'
        values.any? { |value| value }
      RUBY



      row :a_inflection         , :ordinal              , [] , "The suffix that should be added to a number to denote the position in an ordered sequence such as 1st, 2nd, 3rd, 4th", <<-RUBY
        return '' if value.nil?

        value = value.to_i if value.is_a? String

        value.ordinal
      RUBY

      row :a_inflection         , :ordinalize           , [] , "Turns a number into an ordinal string used to denote the position in an ordered sequence such as 1st, 2nd, 3rd, 4th.", <<-RUBY
        return '' if value.nil?

        value = value.to_i if value.is_a? String

        value.ordinalize
      RUBY

      row :a_inflection         , :pluralize            , [] , "Returns the plural form of the word in the string", <<-RUBY
        return '' if value.nil?

        value = value.to_s if value.is_a?(Symbol)

        value.pluralize
      RUBY

      row :a_inflection         , :pluralize_by_number  , [] , "Uses both a word and number to decide if the plural or singular form should be used.", <<-'RUBY'
        return '' if value.nil?

        count = count.to_i if count.is_a? String
        format = :word if format.nil?

        case format.to_sym
        when :number_word, :number_and_word
          "#{count} #{value.pluralize(count)}"
        else # aka :word
          value.pluralize(count)
        end
      RUBY
      
      # row :a_inflection         , :singularize          , [] , ""
    end
  end
  
  @functions = result.raw_data_struct.rows
end
@functions = nil
