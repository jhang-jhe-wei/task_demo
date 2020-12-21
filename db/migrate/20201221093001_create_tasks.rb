class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :content
      t.string :tag
      t.integer :user_id
      t.datetime :start
      t.datetime :end
      t.integer :piority
      t.integer :state

      t.timestamps
    end
  end
end
