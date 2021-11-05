class LeaderboardController < ApplicationController
  def index
    sql = 
      'with data as (
        select 
          r.user_id, 
          sum(t.points) as rating, 
          count(*) as tasks_solved 
        from results r 
        join tasks t 
          on r.task_id=t.id 
        group by user_id
      ) 
      select 
        u.id as user_id,
        u.username, 
        d.rating, 
        d.tasks_solved, 
        u.created_at as reg_date 
      from data d 
      join users u 
        on d.user_id=u.id 
      order by d.rating desc'
    @ratings = ActiveRecord::Base.connection.exec_query(sql)
  end
end
