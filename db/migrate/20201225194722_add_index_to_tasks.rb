class AddIndexToTasks < ActiveRecord::Migration[6.1]
  def change
    add_index :tasks, :title
    add_index :tasks, :state
    add_index :tasks, :piority
  end
end
