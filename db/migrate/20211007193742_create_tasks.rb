class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.text :correct_sql
      t.integer :points

      t.timestamps
    end
  end
end
