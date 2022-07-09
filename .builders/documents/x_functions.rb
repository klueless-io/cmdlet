# frozen_string_literal: true

def category_blueprint
  fn_builder
    .init
    .category(:array      , active: 0 , title: 'Array'       , description: 'Functions for working with Array')
    .category(:cases      , active: 0 , title: 'Cases'       , description: 'Functions for working with Cases')
    .category(:code       , active: 0 , title: 'Code'        , description: 'Functions for working with Code')
    .category(:collection , active: 0 , title: 'Collection'  , description: 'Functions for working with Collection')
    .category(:comparison , active: 0 , title: 'Comparison'  , description: 'Functions for working with Comparison')
    .category(:date       , active: 0 , title: 'Date'        , description: 'Functions for working with Date')
    .category(:file       , active: 0 , title: 'File'        , description: 'Functions for working with File')
    .category(:html       , active: 0 , title: 'Html'        , description: 'Functions for working with Html')
    .category(:i18n       , active: 0 , title: 'I18n'        , description: 'Functions for working with Internationalization')
    .category(:inflection , active: 1 , title: 'Inflection'  , description: 'Functions for working with Inflection')
    .category(:logging    , active: 0 , title: 'Logging'     , description: 'Functions for working with Logging')
    .category(:markdown   , active: 0 , title: 'Markdown'    , description: 'Functions for working with Markdown')
    .category(:match      , active: 0 , title: 'Match'       , description: 'Functions for working with Match')
    .category(:math       , active: 0 , title: 'Math'        , description: 'Functions for working with Math')
    .category(:misc       , active: 0 , title: 'Misc'        , description: 'Functions for working with Misc')
    .category(:number     , active: 0 , title: 'Number'      , description: 'Functions for working with Number')
    .category(:object     , active: 0 , title: 'Object'      , description: 'Functions for working with Object')
    .category(:path       , active: 0 , title: 'Path'        , description: 'Functions for working with Path')
    .category(:regex      , active: 0 , title: 'Regex'       , description: 'Functions for working with Regex')
    .category(:string     , active: 0 , title: 'String'      , description: 'Functions for working with String')
    .category(:url        , active: 0 , title: 'Url'         , description: 'Functions for working with Url')
end

def function_blueprint
  fn_builder
    .init
    .for_category(:array)
    .for_category(:cases)
    .for_category(:code)
    .for_category(:collection)
    .for_category(:comparison)
    .for_category(:date)
    .for_category(:file)
    .for_category(:html)
    .for_category(:i18n)
    .for_category(:inflection)
    .function(:ordinal)
    .function(:ordinalize)
    .function(:pluralize_by_number)
    .function(:pluralize)
    .function(:singularize)
    .for_category(:logging)
    .for_category(:markdown)
    .for_category(:match)
    .for_category(:math)
    .for_category(:misc)
    .for_category(:number)
    .for_category(:object)
    .for_category(:path)
    .for_category(:regex)
    .for_category(:string)
    .for_category(:url)
end

# {{arrayify}}
# Cast the given value to an array.
# {{before}}
# Return all of the items in the collection before the specified count. Opposite of after.
