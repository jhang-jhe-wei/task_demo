class AddAdminDefaultToUsers < ActiveRecord::Migration[6.1]
  def change
    change_column(:users, :admin, :boolean, default: 0)
  end
end
