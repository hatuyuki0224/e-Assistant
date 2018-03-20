class RenameUseRtaskColumnToEvent < ActiveRecord::Migration[5.1]
  def change
    rename_column :events, :user_task, :user_event
  end
end
