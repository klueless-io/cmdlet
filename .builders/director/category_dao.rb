# frozen_string_literal: true

class CategoryDao
  attr_reader :k_builder
  attr_reader :load_time
  attr_reader :data

  def initialize(k_builder)
    @k_builder = k_builder
    @load_time = nil
    @data = nil
  end

  def file_name
    k_builder.target_folders.join(:builder_data, 'categories.json')
  end

  def reload?
    @load_time.nil? || @load_time < File.mtime(file_name)
  end

  def find_category(name)
    result = categories.find { |category| category[:name] == name.to_s }

    raise "Category #{name} not found" if result.nil?

    result
  end

  def categories
    if reload?
      @data = JSON.parse(File.read(file_name), symbolize_names: true)
      @categories = data[:categories]
      @load_time = File.mtime(file_name)
    end
    @categories
  end
end
