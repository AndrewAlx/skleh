class ExerciseCategoriesController < ApplicationController
  def index
    @contests = Contest.where(end_time: nil)
  end

  def show
    @contest = Contest.find(params[:id])
    redirect_to contest_tasks_path(@contest)
  end
end
