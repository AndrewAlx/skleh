class ContestsController < ApplicationController
  def index
    @contests = Contest.where.not(end_time: nil)
  end

  def show
    @contest = Contest.find(params[:id])
    redirect_to contest_tasks_path(@contest)
  end
end
