class SessionsController < ApplicationController
  def login
  end

  def admin_login
  end

  def new
    @user = User.find_by email: params[:email]
    if @user
      if params[:password] && @user.password == params[:password]
        session[:current_user_id] = @user.id
        redirect_to tasks_path
      else
        redirect_to login_path,notice:"密碼錯誤"
      end
    else
      redirect_to login_path,notice:"不存在此用戶"
    end
  end

  def admin_new
    @user = User.find_by email: params[:email]
    if @user
      if params[:password] && @user.password == params[:password]
        session[:current_user_id] = @user.id
        if @user.admin
          redirect_to(admin_users_path)
        else
          redirect_to(tasks_path,notice:"權限不足")
        end
      else
        redirect_to admin_login_path,notice:"密碼錯誤"
      end
    else
      redirect_to admin_login_path,notice:"不存在此用戶"
    end
  end

  def destroy
    session[:current_user_id] = nil
    redirect_to login_path
  end
end
