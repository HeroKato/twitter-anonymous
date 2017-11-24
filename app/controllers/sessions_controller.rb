class SessionsController < ApplicationController
   def create
    auth = request.env["omniauth.auth"]
    session[:oauth_token] = auth.credentials.token
    session[:oauth_token_secret] = auth.credentials.secret
    session[:nickname] = auth.info.nickname
    session[:user_id] = user.id
    flash[:success] ='ログインしました。'
    redirect_to root_path
   end
   
   def destroy
    session[:user_id] = nil
    session[:oauth_token] = nil
    session[:oauth_token_secret] = nil
    session[:nickname] = nil
    flash[:info] = 'ログアウトしました。'
    redirect_to root_path
   end
end
