class ChangeTagInTasks < ActiveRecord::Migration[6.1]
  def up
    ALTER TABLE tasks ALTER COLUMN tag TYPE integer USING(tag::integer)
  end

  def down
    change_column(:tasks, :tag, :string)
  end
end
