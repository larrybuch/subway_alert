class HomeController < ApplicationController
  layout "index"

  def index
    @user = User.new
    @lines = Line.all
  end
end