class SessionController < ApplicationController
skip_before_action :require_login, only: [:new, :login]
  def new
    # user_role = (User.find_by id: session[:user_id]).id
    # unless user_role.nil?
    if User.find_by id: session[:user_id]
      user = User.find_by id: session[:user_id]
      redirect_to user
    end
  end
  def login
    user = User.find_by user_name: params[:session][:user_name].downcase
    if user && user.authenticate(params[:session][:password])
      flash[:success] = "Login success"
      log_in user
      redirect_to user
    else
      flash[:danger] = "Invalid email/password combination"
      render :new
    end
  end

  def logout
    log_out
    redirect_to login_path
  end

end
