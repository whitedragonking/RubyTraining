class UserData
  def initialize
    require File.expand_path '../../core/user', __FILE__
    require File.expand_path '../../core/like_status', __FILE__
  end

  def user_all
    User.all.to_json
  end
end