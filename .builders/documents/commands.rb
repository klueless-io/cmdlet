def commands
  functions.map do |function|
    category = categories.find { |c| c.name == function.category }

    
    log.error("Category '#{function.category}' not found") unless category
  
    OpenStruct.new(
      category: function.category,
      name: function.name,
      category_description: category.description,
      function_description: function.description,
      ruby: function.ruby,
      usecases: use_cases
        .select { |uc| uc.category == function.category && uc.function == function.name }
        .map { |uc| 
          OpenStruct.new({
            category:         uc.category,
            function:         uc.function,
            inputs:           uc.inputs,
            nice_inputs:      nice_inputs(uc.inputs),
            expected_output:  uc.expected_output 
          })
        }
    )
  end
end

def nice_inputs(values)
  values.map { |value| value.is_a?(String) ? "'#{value}'" : value }.join(', ')
end