# frozen_string_literal: true

class CmdletDirector < KDirector::Directors::BaseDirector
  default_builder_type(CmdletBuilder)

  def category(name, description)
    builder.category(name, description)

    self
  end

  def helper(**opts, &block)
    helper = CmdletChild.new(self, **opts)
    helper.instance_eval(&block) if block_given?

    self
  end

  def build_helpers
    builder.helpers.each do |helper|
      cd(:lib)
      add("helpers/#{helper[:category]}/#{helper[:name]}.rb", template_file: 'helper.rb', helper: helper)

      cd(:spec)
      add("helpers/#{helper[:category]}/#{helper[:name]}_spec.rb", template_file: 'helper_spec.rb', helper: helper)
    end

    self
  end

  def save_categories
    cd(:builder_data)
    add('categories.json', content: JSON.pretty_generate(builder.categories.map(&:to_h)))
    play_actions
  end
end
