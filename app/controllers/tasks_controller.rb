class TasksController < ApplicationController
  def index
    if !current_user
      redirect_to new_user_session_path
      return
    end
    @contest = Contest.find(params[:contest_id])
    @tasks = Task.where(contest_id: params[:contest_id]).order(:id)
    @task_solved = Hash.new
    @contest_participation = ContestParticipation.for(current_user, @contest)&.first
    @tasks.map do |task|
      result = Result.for(current_user, task)&.first&.user_query
      @task_solved[task] = result.present?
    end
  end

  def show
    if !current_user
      redirect_to new_user_session_path
      return
    end
    @task = Task.find(params[:id])
    @user_query = Result.for(current_user, @task)&.first&.user_query || ""
    if params[:q]
      query = params[:q][:query] if params[:q][:query].present?
    end
    if allowed_to? :solve?, @task
      if query.present?
        query_info = UserQueryInfo.new(user_id: current_user.id,
                                       task_id: @task.id,
                                       started_at: Time.now,
                                       user_query: query)
        @query_result = execute_sql(query)
        @correct_result = execute_sql(@task.correct_sql)
        query_info.ended_at = Time.now
        query_info.save
        if @query_result.present? && @correct_result.present? && @query_result.rows == @correct_result.rows
          old_result = Result.where(user: current_user, task: @task)&.first
          if old_result.present?
            old_result.user_query = query
            old_result.save
          else
            result = Result.new(user: current_user, task: @task, user_query: query)
            result.save
          end
        end
      end
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def execute_sql(sql)
    begin
      results = ActiveRecord::Base.connection.exec_query(sql)
    rescue ActiveRecord::StatementInvalid
      return nil
    end
    if results.present?
      return results
      nil
    end
  end
end
