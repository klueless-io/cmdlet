# frozen_string_literal: true

class CategoryDirector < KDirector::Directors::BaseDirector
  def category(name, description)
    value = {
      name: name,
      description: description
    }

    builder.add(:categories, value: value)

    self
  end

  def category_file
    k_builder.target_folders.join(:builder_data, 'categories.json')
  end

  def save_categories
    cd(:builder_data)
    add('categories.json', content: builder.to_json)

    self
  end
end
