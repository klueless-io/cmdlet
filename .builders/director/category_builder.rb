# frozen_string_literal: true

class CategoryBuilder < KDirector::Builders::ActionsBuilder
  def category(name, description)
    value = {
      name: name,
      description: description
    }

    add(:categories, value: value)

    self
  end

  def save_categories(**opts)
    k_builder
      .cd(:builder_data)
      .add('categories.json', content: to_json, **opts)

    self
  end

  def osave_categories(**opts)
    save_categories(**{ open: true }.merge(opts))
  end
end
