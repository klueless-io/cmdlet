def categories
  return @categories unless @categories.nil?

  
  result = KDoc.model :document do
    table :rows do
      fields :name, :description

      row :case               , "Tokenize and apply case and/or separator"
      row :comparison         , "Comparison helpers, eg. or, and, equal, not equal, less than, greater than etc."
      row :inflection         , "Inflection handling routines, eg. pluralize, singular, ordinalize"
      row :string             , "String handling helpers"

      row :array            , "Array handling routines, eg. join, join_prefix, join_post"
      row :a_transform        , "Tokenize and apply case and/or separator"
      row :a_comparison       , "Comparison helpers, eg. or, and, equal, not equal, less than, greater than etc."
      row :a_inflection       , "Inflection handling routines, eg. pluralize, singular, ordinalize"
    end
  end
  
  @categories = result.raw_data_struct.rows
end
@categories = nil

