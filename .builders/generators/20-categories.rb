# frozen_string_literal: true

KManager.action :categories do
  action do
    CategoryDirector
      .init(k_builder)
      .category(:array      , 'Array handling routines, eg. join, join_prefix, join_post')
      .category(:case       , 'Tokenize and apply case and/or separator')
      .category(:comparison , 'Comparison helpers, eg. or, and, equal, not equal, less than, greater than etc.')
      .category(:inflection , 'Inflection handling routines, eg. pluralize, singular, ordinalize')
      .category(:misc       , 'Miscellaneous cmdlets')
      .save_categories
      .generate
  end
end
