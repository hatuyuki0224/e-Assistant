class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :task_name
      t.date :deadline_date
      t.time :deadline_time
      t.time :required_time
      t.integer :priority
      t.string :color
      t.text :comment

      t.timestamps
    end
  end
end
