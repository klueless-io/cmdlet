# frozen_string_literal: true

def data_access
  @data_access ||= Dao.new(k_builder)
end

class Dao
  attr_reader :k_builder
  attr_reader :category
  attr_reader :cmdlet

  def initialize(k_builder)
    @category = CategoryDao.new(k_builder)
    @cmdlet = CmdletDao.new(k_builder)
  end
end
