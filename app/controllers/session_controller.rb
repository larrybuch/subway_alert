class SessionController < ApplicationController
  def new
  end

  def create
    user = User.find_by_username(params[:username])
    if user && user.authenticate(params[:password])
      session[:username] = user.username
      session[:id] = user[:id]
      redirect_to edit_user_path(user)
    else
      render :new
    end
  end

  def destroy
    reset_session #Session was maintaining the same :id even after logout. This will reset it all.
    redirect_to root_path
  end
end