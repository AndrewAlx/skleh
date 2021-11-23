class ContestsController < ApplicationController
  def index
    @contests = Contest.where("end_time >= ?", Time.now).order(:id)
    @finished_contests = Contest.where("end_time < ?", Time.now).order(id: :desc)
  end

  def show
    @contest = Contest.find(params[:id])
    redirect_to contest_tasks_path(@contest)
  end

  def add_participant
    @contest = Contest.find(params[:id])
    participation = ContestParticipation.new(user: current_user, contest: @contest, entering_time: Time.now)
    participation.save
    redirect_to contest_tasks_path(@contest)
  end
end
