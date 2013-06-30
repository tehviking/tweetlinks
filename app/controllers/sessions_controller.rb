class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(env['omniauth.auth'])
    session[:user_id] = user.id
    session[:twitter_token] = env['omniauth.auth']['credentials']['token']
    session[:twitter_secret] = env['omniauth.auth']['credentials']['secret']
    session[:token] = SecureRandom.hex(16)
    user.twitter_token = session[:twitter_token]
    user.twitter_secret = session[:twitter_secret]
    user.save
    redirect_to root_url, notice: "Signed in."
  end

  def destroy
    session[:user_id] = nil
    session[:twitter_token] = nil
    session[:twitter_secret] = nil
    session[:token] = nil
    redirect_to root_url, notice: "Signed out."
  end
end