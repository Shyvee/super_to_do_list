class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.date :due_date
      t.text :task_name
      t.time :due_time
      t.boolean :complete
      t.integer :row_order
      t.integer :user_id
      t.text :notes
      t.boolean :high_priority
      t.integer :category_id

      t.timestamps

    end
  end
end
