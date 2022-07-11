# frozen_string_literal: true

class CategoryDirector < KDirector::Directors::BaseDirector
  defaults(builder_type: CategoryBuilder, on_exist: :write, on_action: :execute)

  def category(name, description)
    builder.category(name, description)

    self
  end

  def generate
    generate_require_all_cmdlets

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

  private

  def generate_require_all_cmdlets
    cd(:lib)
    add('_.rb',
      template_file: 'cmdlets_require_all.rb',
      cmdlets: data_access.cmdlet.all_cmdlets)

    cd(:handlebars_lib)
    add('_.rb', 
      template_file: 'handlebars_helper_require_all.rb',
      cmdlets: data_access.cmdlet.all_cmdlets)

  end
  
end
