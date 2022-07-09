# frozen_string_literal: true

def use_cases
  return @use_cases unless @use_cases.nil?

  result = KDoc.model :document do
    # table :inputs do
    #   fields :name, :value

    #   row :title              , "Account Category"
    #   row :bsb_account        , "ABC 123"
    #   row :text1              , "the Quick brown Fox 99"
    #   row :sentence1          , "The quick  brown fox, jumped  over the lazy dog"
    #   row :sentence2          , "The quick brown fox"
    #   row :sentence3          , "jumped over the lazy dog"
    #   row :num1               , 1
    #   row :num2               , 2
    #   row :num3               , 3

    # end

    sentence1 = 'The quick  brown fox, jumped  over the lazy dog'
    sentence2 = 'coyote and the acme company'
    text1     = 'the Quick brown Fox 99'

    table :rows do
      # fields :category, :function, :input, :commands, :expected_value
      fields :category  , :function, :inputs, :expected_output

      row :a_inflection , :ordinal        , [1], 'st'
      row :a_inflection , :ordinal        , [2], 'nd'
      row :a_inflection , :ordinal        , [3], 'rd'
      row :a_inflection , :ordinal        , [4], 'th'
      row :a_inflection , :ordinal        , ['101'], 'st'
      row :a_inflection , :ordinal        , ['105'], 'th'

      row :a_inflection , :ordinalize     , [1], '1st'
      row :a_inflection , :ordinalize     , [2], '2nd'
      row :a_inflection , :ordinalize     , [3], '3rd'
      row :a_inflection , :ordinalize     , [4], '4th'
      row :a_inflection , :ordinalize     , ['101'], '101st'
      row :a_inflection , :ordinalize     , ['105'], '105th'

      row :a_inflection , :pluralize      , ['name'], 'names'
      row :a_inflection , :pluralize      , ['octopus'], 'octopi'

      row :a_transform  , :backslash      , [text1]     , 'the\quick\brown\fox99'
      row :a_transform  , :camel          , [text1]     , 'TheQuickBrownFox99'
      row :a_transform  , :constant       , [text1]     , 'THE_QUICK_BROWN_FOX99'
      row :a_transform  , :dash           , [text1]     , 'the-quick-brown-fox99'
      row :a_transform  , :dot            , [text1]     , 'the.quick.brown.fox99'
      row :a_transform  , :double_colon   , [text1]     , 'The::Quick::Brown::Fox99'
      row :a_transform  , :lower          , [text1]     , 'the quick brown fox 99'
      row :a_transform  , :lamel          , [text1]     , 'theQuickBrownFox99'
      row :a_transform  , :proper         , [text1]     , 'The Quick Brown Fox 99'
      row :a_transform  , :proper         , [sentence1] , 'The Quick Brown Fox Jumped Over The Lazy Dog'
      row :a_transform  , :sentence       , [text1]     , 'The quick brown fox 99'
      row :a_transform  , :sentence       , [sentence1] , 'The quick brown fox jumped over the lazy dog'
      # row :a_transform  , :sentence       , [sentence2] , 'Coyote and the ACME company'

      row :a_transform  , :slash          , [text1]     , 'the/Quick/brown/Fox99'
      row :a_transform  , :snake          , [text1]     , 'the_quick_brown_fox99'
      row :a_transform  , :title          , [text1]     , 'The Quick Brown Fox 99'
      row :a_transform  , :title          , [sentence1] , 'The Quick Brown Fox Jumped over the Lazy Dog'
      row :a_transform  , :upper          , [text1]     , 'THE QUICK BROWN FOX 99'

      row :a_comparison , :and            , [nil, nil]        , false
      row :a_comparison , :and            , ['data', nil]     , false
      row :a_comparison , :and            , [nil, 'data']     , false
      row :a_comparison , :and            , %w[data data]  , true
      row :a_comparison , :and            , %w[aaa bbb]    , true

      # DEFAULT does not make sense in comparison
      row :a_comparison , :default        , [nil, 'happy'] , 'happy'
      row :a_comparison , :default        , %w[sad happy] , 'sad'
      row :a_comparison , :default        , [nil, nil, nil, nil, 'david'] , 'david'
      row :a_comparison , :default        , ['', 'happy'] , 'happy'

      # type: :strict, :equiv, :cast, :insensitive
      row :a_comparison , :eq             , [111, '111'], false
      row :a_comparison , :eq             , [111, 111.0], false
      row :a_comparison , :eq             , %w[aaa aaa], true
      row :a_comparison , :eq             , %w[aaa bbb], false
      row :a_comparison , :eq             , %i[aaa aaa] , true
      row :a_comparison , :eq             , ['aaa', :aaa] , false
      row :a_comparison , :eq             , %w[aaa bbb], false
      row :a_comparison , :eq             , %w[aaa AAA], false

      row :a_comparison , :gt             , [2, 1] , true
      row :a_comparison , :gt             , [2, 2] , false

      row :a_comparison , :gte            , [1, 2] , false
      row :a_comparison , :gte            , [1, 1] , true
      row :a_comparison , :gte            , [2, 1] , true

      row :a_comparison , :lt             , [1, 2] , true
      row :a_comparison , :lt             , [2, 1] , false

      row :a_comparison , :lte            , [1, 2] , true
      row :a_comparison , :lte            , [2, 2] , true
      row :a_comparison , :lte            , [2, 1] , false

      row :a_comparison , :ne             , [1, 2] , true
      row :a_comparison , :ne             , [1, 1] , false

      row :a_comparison , :or             , [nil, nil]        , false
      row :a_comparison , :or             , ['data', nil]     , true
      row :a_comparison , :or             , [nil, 'data']     , true
      row :a_comparison , :or             , %w[data data]  , true
      row :a_comparison , :or             , %w[aaa bbb]    , true
      # row :text1          , %i[backslash]     , 'the\quick\brown\fox99'
      # row :text1          , %i[camel]         , 'TheQuickBrownFox99'

      # row :sentence3      , %i[plural]        , "jumped over the lazy dogs"
      # row :title          , %i[plural]        , "Account Categories"
      # row :sentence1      , %i[dash]          , "The-quick-brown-fox-jumped-over-the-lazy-dog"
      # row :sentence1      , %i[natural]       , "The quick brown fox, jumped over the lazy dog"
      # row :sentence1      , %i[lower dash]    , "the-quick-brown-fox-jumped-over-the-lazy-dog"
      # row :bsb_account    , %i[lower snake]   , "abc_123"
      # row :bsb_account    , %i[slash]         , "ABC/123"
    end
  end

  @use_cases = result.raw_data_struct.rows
end
@use_cases = nil

# def self.camel_case(string, tokenizer = PreservePrefixedUnderscoreTokenizer.new)
#   # DAVE INPUT 9 Oct 21 from lucky_case play
#   # dependency injection: to use enhanced tokenizer
#   a = split_case_string string
#   converted = ([a[0]] + a[1..-1].map { |e| capital e }).join('')
#   tokenizer.parse(converted)
# end
