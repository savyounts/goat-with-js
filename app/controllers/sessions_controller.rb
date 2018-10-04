class SessionsController < ApplicationController

  def new
  end

  def create
    # if request.env["onmiauth.auth"]
    #   @user = User.find_or_create_by_omniauth(auth)
    #   session[:user_id] = @user.id
    #   redirect_to user_path(@user)
    # else
      @user = User.find_by(username: params[:username])
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        redirect_to '/login'
      end
    # end
  end



  def destroy
    session.clear
    redirect_to root_path
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end
