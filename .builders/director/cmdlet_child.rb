# frozen_string_literal: true

class CmdletChild < KDirector::Directors::ChildDirector
  def initialize(parent, **opts)
    super(parent, **opts)

    builder.add_cmdlet
  end

  def name(value)
    builder.cmdlet_setting(:name, value)
  end

  def description(value)
    builder.cmdlet_setting(:description, value)
  end

  def result(value)
    builder.cmdlet_setting(:result, value)
  end

  def ruby(value)
    builder.cmdlet_setting(:ruby, value)
  end

  def parameter(name, description, splat: false, default: nil, param_type: 'String')
    builder.add_cmdlet_parameter(
      name,
      description,
      splat: splat,
      default: default,
      param_type: param_type
    )
  end

  def example(value)
    builder.add_cmdlet_example(value)
  end
end
