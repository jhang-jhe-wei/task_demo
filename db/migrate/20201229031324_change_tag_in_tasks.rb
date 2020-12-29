class ChangeTagInTasks < ActiveRecord::Migration[6.1]
  def up
    change_column(:tasks, :tag, "integer USING CAST(tag AS integer)")
  end

  def down
    change_column(:tasks, :tag, :string)
  end
end
