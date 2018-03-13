class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionHelper
  before_action :require_login
  # @id = session[:user_id]
  # SessionHelper.getRole
  # def isLoggedIn
  #   return session[:user_id]
  # end
  def require_login
    unless logged_in?
      flash[:success] = "User is not Logged in"
      redirect_to login_path
    end
  end
end
