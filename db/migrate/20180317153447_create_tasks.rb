class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :task_name
      t.datetime :deadline
      t.column :required_time, :interval
      t.integer :priority
      t.string :color
      t.text :comment

      t.timestamps
    end
  end
end
