KManager.action :categories do
  action do

    CategoryDirector
      .init(k_builder,
        on_exist:                   :write,                      # %i[skip write compare]
        on_action:                  :execute                     # %i[queue execute]
      )
      .category(:case               , "Tokenize and apply case and/or separator")
      .category(:comparison         , "Comparison helpers, eg. or, and, equal, not equal, less than, greater than etc.")
      .category(:inflection         , "Inflection handling routines, eg. pluralize, singular, ordinalize")
      .category(:string             , "String handling helpers")
      .category(:a_array            , "Array handling routines, eg. join, join_prefix, join_post")
      .category(:a_transform        , "Tokenize and apply case and/or separator")
      .category(:a_comparison       , "Comparison helpers, eg. or, and, equal, not equal, less than, greater than etc.")
      .category(:a_inflection       , "Inflection handling routines, eg. pluralize, singular, ordinalize")
      .save_categories
      .category_file
  end
end
