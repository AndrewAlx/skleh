class CreateContestParticipations < ActiveRecord::Migration[6.1]
  def change
    create_table :contest_participations do |t|
      t.integer :user_id
      t.integer :contest_id
      t.datetime :entering_time
    end
  end
end
