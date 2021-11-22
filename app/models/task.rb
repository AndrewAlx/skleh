class Task < ApplicationRecord
  belongs_to :contest

  attr_accessor :query

  def results
    Result.where(task_id: id)
  end
end
