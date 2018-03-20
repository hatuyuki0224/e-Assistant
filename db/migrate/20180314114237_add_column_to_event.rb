class AddColumnToEvent < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :user_task, :string
  end
end
