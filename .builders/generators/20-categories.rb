# frozen_string_literal: true

KManager.action :categories do
  action do
    CategoryDirector
      .init(k_builder)
      .category(:case       , 'Tokenize and apply case and/or separator')
      .category(:comparison , 'Comparison helpers, eg. or, and, equal, not equal, less than, greater than etc.')
      .category(:inflection , 'Inflection handling routines, eg. pluralize, singular, ordinalize')
      .category(:string     , 'String handling helpers')
      .category(:array      , 'Array handling routines, eg. join, join_prefix, join_post')
      .category(:transform  , 'Tokenize and apply case and/or separator')
      .category(:comparison , 'Comparison helpers, eg. or, and, equal, not equal, less than, greater than etc.')
      .category(:inflection , 'Inflection handling routines, eg. pluralize, singular, ordinalize')
      .save_categories
  end
end
