module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def current_connection
    @current_connection ||= Connection.last
  end

  def connection_valid?
    current_connection.updated_at > Time.now - 60.minutes
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
