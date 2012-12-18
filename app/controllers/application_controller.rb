class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authenticate_user
  private
  def authenticate_user
   if session[:username]
      @authenticated_user = User.where(:username => session[:username])[0]
   else
      @authenticated_user = nil
      # redirect_to login_path
   end
  end
end