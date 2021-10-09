class Result < ApplicationRecord
  belongs_to :user
  belongs_to :task

  scope :for, -> (user, task) {
    where('results.user_id = ? and results.task_id = ?', user.id, task.id)
  }
end
