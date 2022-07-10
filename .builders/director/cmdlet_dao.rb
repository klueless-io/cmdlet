# frozen_string_literal: true

class CmdletDao
  attr_reader :k_builder

  def initialize(k_builder)
    @k_builder = k_builder
  end

  def all_cmdlets
    data_access
      .category
      .categories.flat_map { |category| read_cmdlets(category[:name]) }
      .compact
      .uniq
      .sort_by { |r| [r[:category], r[:name]] }
  end

  private

  def read_cmdlets(category_name)
    file_name = k_builder.target_folders.join(:builder_data, 'cmdlets', "#{category_name}.json")

    return JSON.parse(File.read(file_name), symbolize_names: true)[:cmdlets] if File.exist?(file_name)

    puts "Cmdlet file #{file_name} not found"
    nil
  end
end
