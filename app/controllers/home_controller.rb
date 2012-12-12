class HomeController < ApplicationController
  def index
    @user = User.new
    @lines = Line.all
  end
end