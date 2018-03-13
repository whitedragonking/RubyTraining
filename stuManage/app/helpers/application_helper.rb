module ApplicationHelper
  def current_class?(test_path)
    return 'active' if request.path == test_path
    ''
  end
  def getRole
    if User.find_by id: session[:user_id]
      return @role = (User.find_by id: session[:user_id]).role
    end
  end
  def getUserLogged
    return User.find_by id: session[:user_id]
  end
  def getUserID
    return session[:user_id]
  end
end
