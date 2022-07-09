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

  def build_cmdlets
    builder.cmdlets.each do |cmdlet|
      cmdlet_file = "#{cmdlet[:category]}/#{cmdlet[:name]}.rb"

      cd(:lib)
      add(cmdlet_file, template_file: 'cmdlet.rb', cmdlet: cmdlet)

      cd(:spec)
      add("#{cmdlet[:category]}/#{cmdlet[:name]}_spec.rb", template_file: 'cmdlet_spec.rb', cmdlet: cmdlet)
    end

    
    Dir.chdir(k_builder.target_folders.get(:app)) do
      k_builder.run_cop('**/*.rb', fix_unsafe: true)
    end

    self
  end
end
