# frozen_string_literal: true

class CmdletDirector < KDirector::Directors::BaseDirector
  defaults(builder_type: CmdletBuilder, on_exist: :write, on_action: :execute)

  def initialize(k_builder, builder, **opts)
    super(k_builder, builder, **opts)

    builder.category_key = opts[:category] || :unknown
  end

  def cmdlet(**opts, &block)
    cmdlet = CmdletChild.new(self, **opts)
    cmdlet.instance_eval(&block) if block_given?

    self
  end

  def categories
    data_access.category_director.categories
  end

  def generate
    build_cmdlets
    save_cmdlets
    run_cop

    self
  end

  def build_cmdlets
    builder.cmdlets.each do |cmdlet|
      cmdlet_file = "#{cmdlet[:category]}/#{cmdlet[:name]}.rb"
      cmdlet_spec_file = "#{cmdlet[:category]}/#{cmdlet[:name]}_spec.rb"
      handlebars_file = "handlebarsjs/helpers/#{cmdlet[:category]}/#{cmdlet[:name]}.rb"
      handlebars_spec_file = "handlebarsjs/helpers/#{cmdlet[:category]}/#{cmdlet[:name]}_spec.rb"

      cd(:lib)
      add(cmdlet_file, template_file: 'cmdlet.rb', cmdlet: cmdlet)

      cd(:spec)
      add(cmdlet_spec_file, template_file: 'cmdlet_spec.rb', cmdlet: cmdlet, on_exist: :skip)

      cd(:handlebars_lib)
      add(handlebars_file, template_file: 'handlebars_helper.rb', cmdlet: cmdlet)

      cd(:handlebars_spec)
      add(handlebars_spec_file, template_file: 'handlebars_helper_spec.rb', cmdlet: cmdlet, on_exist: :skip)
    end

    self
  end

  def run_cop
    Dir.chdir(k_builder.target_folders.get(:app)) do
      k_builder.run_cop('**/*.rb', fix_unsafe: true)
    end

    Dir.chdir(k_builder.target_folders.get(:handlebars)) do
      k_builder.run_cop('**/*.rb', fix_unsafe: true)
    end

    self
  end

  def save_cmdlets
    cd(:builder_data)
    add("cmdlets/#{builder.category_key}.json", content: builder.to_json)

    self
  end
end
