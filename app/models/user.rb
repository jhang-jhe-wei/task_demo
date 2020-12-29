class User < ApplicationRecord
  has_many :tasks
  before_destroy :destroy_tasks
  before_destroy :have_other_admin_to_destroy
  validates :name , presence: true
  validates :email, presence: true
  validates :phone, presence: true
  validates :password, presence: true
  def destroy_tasks
    tasks = Task.where user_id: id
    tasks.each do |task|
        task.destroy
    end
  end

  def have_other_admin_to_destroy
    if admin
        unless User.where(admin: true).count > 1
            errors.add :user, "管理員僅剩餘1名，故無法刪除"
            throw(:abort)
        end
    end
  end
  
end
