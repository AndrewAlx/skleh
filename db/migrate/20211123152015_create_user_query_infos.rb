class CreateUserQueryInfos < ActiveRecord::Migration[6.1]
  def change
    create_table :user_query_infos do |t|
      t.integer :task_id
      t.integer :user_id
      t.datetime :started_at
      t.datetime :ended_at
      t.text :user_query

      t.timestamps
    end
  end
end
