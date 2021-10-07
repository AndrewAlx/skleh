class CreateContests < ActiveRecord::Migration[6.1]
  def change
    create_table :contests do |t|
      t.string :name
      t.integer :organizer_id
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
