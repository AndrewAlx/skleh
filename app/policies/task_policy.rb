class TaskPolicy < ApplicationPolicy
  # See https://actionpolicy.evilmartians.io/#/writing_policies
  #
  # def index?
  #   true
  # end
  #
  # def update?
  #   # here we can access our context and record
  #   user.admin? || (user.id == record.user_id)
  # end

  # Scoping
  # See https://actionpolicy.evilmartians.io/#/scoping
  #
  # relation_scope do |relation|
  #   next relation if user.admin?
  #   relation.where(user: user)
  # end

  def solve?
    query_info = UserQueryInfo.where(user_id: user.id, task_id: record.id).order(ended_at: :desc)&.last
    record.contest.active? && ((not query_info.present?) || query_info.cooldown_ended?)
  end

  def view_participants?
    user.admin? || record.contest.user == user
  end
end
