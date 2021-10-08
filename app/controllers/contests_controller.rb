class ContestsController < ApplicationController
  def index
    @contests = Contest.all
  end

  def show
    @contest = Contest.find(params[:id])
    redirect_to contest_tasks_path(@contest)
  end
end
