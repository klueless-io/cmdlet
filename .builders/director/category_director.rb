# frozen_string_literal: true

class CategoryDirector < KDirector::Directors::BaseDirector
  defaults(builder_type: CategoryBuilder, on_exist: :write, on_action: :execute)

  def category(name, description)
    builder.category(name, description)

    self
  end

  def save_categories(**opts)
    cd(:builder_data)
    add('categories.json', content: builder.to_json, **opts)

    self
  end

  def osave_categories(**opts)
    save_categories(**{ open: true }.merge(opts))
  end
end
