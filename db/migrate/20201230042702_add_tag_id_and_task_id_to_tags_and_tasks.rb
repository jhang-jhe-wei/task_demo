class AddTagIdAndTaskIdToTagsAndTasks < ActiveRecord::Migration[6.1]
  def change
    add_column :tags, :task_id, :integer
    rename_column :tasks, :tag, :tag_id

    add_index :tasks, :tag_id
    add_index :tags, :task_id
  end
end
