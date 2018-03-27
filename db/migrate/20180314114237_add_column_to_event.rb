class AddColumnToEvent < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :user_task, :string
    add_column :events, :user_event, :string
  end
end
