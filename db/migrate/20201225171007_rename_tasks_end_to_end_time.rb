class RenameTasksEndToEndTime < ActiveRecord::Migration[6.1]
  def change
    rename_column :tasks, :end, :end_time
    rename_column :tasks, :start, :start_time
  end
end
