# frozen_string_literal: true

class CmdletBuilder < KDirector::Builders::ActionsBuilder
  attr_reader :current_cmdlet

  def initialize
    super

    dom[:category_key] = nil
    dom[:cmdlets] = []
  end

  def category_key
    dom[:category_key]
  end

  def category_key=(value)
    set(:category_key, value: value)
  end

  def cmdlets
    dom[:cmdlets]
  end

  def add_cmdlet
    @current_cmdlet = new_cmdlet
    dom[:cmdlets] << current_cmdlet
  end

  def cmdlet_setting(name, value)
    @current_cmdlet[name] = value
  end

  def add_cmdlet_parameter(name, description, **opts)
    parameter = {
      name: name,
      description: description
    }.merge(opts)

    @current_cmdlet[:parameters] << parameter
  end

  def add_cmdlet_example(value)
    lines = value.split("\n")
    value = lines.map { |line| "        # #{line.strip}" }.join("\n")

    @current_cmdlet[:examples] << value
  end

  private

  def new_cmdlet
    category = data_access.category.find_category(category_key)

    {
      name: nil,
      description: nil,
      result: nil,
      category: category[:name],
      category_description: category[:description],
      base_class_require: nil,
      base_class: nil,
      parameters: [],
      examples: []
    }
  end
end
