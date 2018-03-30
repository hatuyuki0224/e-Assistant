class ChangeDatatypeDeadlineDate < ActiveRecord::Migration[5.1]
  def change
    change_column :tasks, :deadline_date, :datetime
  end
end
