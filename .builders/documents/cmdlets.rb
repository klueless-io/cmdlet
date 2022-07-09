# frozen_string_literal: true

def cmdlets
  commands.map do |command|
    category = categories.find { |c| c.name == command.category }

    log.error("Category '#{command.category}' not found") unless category

    OpenStruct.new(
      category: command.category,
      name: command.name,
      category_description: category.description,
      command_description: command.description,
      ruby: command.ruby,
      usecases: use_cases
        .select { |uc| uc.category == command.category && uc.command == command.name }
        .map do |uc|
          OpenStruct.new({
                           category: uc.category,
                           command: uc.command,
                           inputs: uc.inputs,
                           nice_inputs: nice_inputs(uc.inputs),
                           expected_output: uc.expected_output
                         })
        end
    )
  end
end

def nice_inputs(values)
  values.map { |value| value.is_a?(String) ? "'#{value}'" : value }.join(', ')
end
