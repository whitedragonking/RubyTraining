class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionHelper
  def isLoggedIn
    return session[:user_id]
  end

end
