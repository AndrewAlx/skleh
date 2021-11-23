class UserQueryInfo < ApplicationRecord
  belongs_to :user
  belongs_to :task

  MIN_COOLDOWN_OFFSET = 1.second
  DURATION_COEFFICIENT = 2.5

  def duration
    (ended_at - started_at).seconds
  end

  def cooldown_ended?
    offset = [MIN_COOLDOWN_OFFSET, duration * 2.5].max
    Time.now > ended_at + offset
  end
end