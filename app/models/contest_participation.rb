class ContestParticipation < ApplicationRecord
  belongs_to :user
  belongs_to :contest

  scope :for, -> (user, contest) {
    where('contest_participations.user_id = ? and contest_participations.contest_id = ?', user.id, contest.id)
  }
end
