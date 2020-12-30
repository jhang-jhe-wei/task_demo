class AddUserindexToTasks < ActiveRecord::Migration[6.1]
  def change
    add_index :tasks, :user_id
  end
end
