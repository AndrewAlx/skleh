class UsersController < ApplicationController
  def index
    redirect_to root_url
    return
  end

  def show
    @user = User.find(params[:id])
    sql = 
      "select 
        coalesce(sum(t.points), 0) as rating, 
        count(*) as tasks_solved 
      from results r 
      join tasks t 
        on r.task_id=t.id 
      where user_id=#{params[:id]}"
    @user_stats = ActiveRecord::Base.connection.exec_query(sql).first
  end
end
