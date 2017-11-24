class SessionsController < ApplicationController
   def create
    auth = request.env['omniauth.auth']
    user = User.create_with_omniauth(auth)
    session[:user_id] = user.id
    flash[:success] ='ログインしました。'
    redirect_to root_path
   end
   
   def destroy
    session[:user_id] = nil
    flash[:info] = 'ログアウトしました。'
    redirect_to root_path
   end
end
