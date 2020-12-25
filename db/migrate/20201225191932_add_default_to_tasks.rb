class AddDefaultToTasks < ActiveRecord::Migration[6.1]
  def change
    change_column(:tasks, :piority, :Integer, { :limit => 2, default: 0 })
    change_column(:tasks, :state, :Integer, { :limit => 2, default: 0 })
  end
end
