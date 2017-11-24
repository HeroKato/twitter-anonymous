class SessionsController < ApplicationController
   def create
    
    flash[:success] ='ログインしました。'
    redirect_to root_path
   end
   
   def destroy
   
    flash[:info] = 'ログアウトしました。'
    redirect_to root_path
   end
end
