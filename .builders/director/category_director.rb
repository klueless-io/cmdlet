# frozen_string_literal: true

class CategoryDirector < KDirector::Directors::BaseDirector
  defaults(builder_type: CategoryBuilder, on_exist: :write, on_action: :execute)

  def category(name, description)
    builder.category(name, description)

    self
  end

  def generate
    generate_require_all_cmdlets
    run_cop

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

    add('handlebarsjs/handlebars_configuration_defaults.rb',
      template_file: 'handlebars_helper_configuration_defaults.rb',
      cmdlet_categories: data_access.cmdlet.all_cmdlets_by_category)
  end

  def run_cop
    Dir.chdir(k_builder.target_folders.get(:lib)) do
      k_builder.run_cop('**/*.rb', fix_unsafe: true)
    end

    Dir.chdir(k_builder.target_folders.get(:handlebars_lib)) do
      k_builder.run_cop('**/*.rb', fix_unsafe: true)
    end

    self
  end


end
