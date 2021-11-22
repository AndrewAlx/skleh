class Contest < ApplicationRecord
  has_many :tasks
  belongs_to :user

  def participants
    ContestParticipation.where(contest_id: id).map(&:user)
  end
end
