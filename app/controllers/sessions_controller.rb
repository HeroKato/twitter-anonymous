class SessionsController < ApplicationController
   def create
    user = User.find_or_create_from_auth(request.env['omniauth.auth'])
    session[:user_id] = user.id
    redirect_to root_path, notice: 'ログインしました。'
   end
   
   def destroy
    session[:user_id] = nil
    flash[:info] = 'ログアウトしました。'
    redirect_to root_path
   end
end
