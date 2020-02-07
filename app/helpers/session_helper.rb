module SessionHelper

  def log_in(user)
    session[:user_id]=user_id
  end

  def current_user
    if(session[:user_id])
      User.find(session[:user_id])
    end
  end

  def logged_in?
    !current_user.nil?
  end

  # Logs out the current user.
  def log_out
    #forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end
end
