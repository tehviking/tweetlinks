module ApplicationHelper
  def logged_in?
    !!current_user
  end

  def token
    session[:token]
  end
end
