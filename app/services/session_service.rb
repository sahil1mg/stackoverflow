class SessionService

  #authenticate user if authenticated the log in and create session
  def login?(email, password)
    user = User.find_by(email: email.downcase)
    if user && user.authenticate(password)
      log_in(user)
      return true
    end
    return false
  end

  #logout using log_out from helper method
  def logout
    log_out
  end

  def get_logger_in_user
    current_user
  end
end