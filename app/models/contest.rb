class Contest < ApplicationRecord
  has_many :tasks
  belongs_to :user

  def participants
    ContestParticipation.where(contest_id: id).map(&:user)
  end

  def active?
    start_time < Time.now && end_time > Time.now
  end
end
