class TasksController < ApplicationController
  def index
    @tasks = Task.where(contest_id: params[:contest_id])
  end

  def show
    @task = Task.find(params[:id])
    if params[:q]
      @query = params[:q][:query] if params[:q][:query].present?
    end
    @query ||= "Нет результатов"
    respond_to do |format|
      format.html
      format.js
    end
  end
end
