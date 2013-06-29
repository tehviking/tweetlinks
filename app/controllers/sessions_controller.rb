class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(env['omniauth.auth'])
    session[:user_id] = user.id
    session[:twitter_token] = env['omniauth.auth']['credentials']['token']
    session[:token] = SecureRandom.hex(16)
    redirect_to root_url, notice: "Signed in."
  end

  def destroy
    session[:user_id] = nil
    session[:twitter_token] = nil
    session[:token] = nil
    redirect_to root_url, notice: "Signed out."
  end
end