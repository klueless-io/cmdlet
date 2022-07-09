# frozen_string_literal: true

def data_access
  @data_access ||= Dao.new(k_builder)
end

class Dao
  attr_reader :k_builder
  attr_reader :category

  def initialize(k_builder)
    @category = CategoryDao.new(k_builder)
  end

  def category_director
    @category_director ||= CategoryDirector.init(k_builder)
  end
end
