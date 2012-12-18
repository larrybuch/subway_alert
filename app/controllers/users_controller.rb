class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
  end

  def new
  end

  def create

    @user = User.new(params[:user])
    @user.username = @user.username.downcase
    @user.save

    username = params[:user][:username]
    session[:username] = username
    session[:id] = @user[:id]

    if @user.save
      lines = params[:line_ids]

      @user.line_ids = lines

      # this stuff below worked, but phil found a better way to do it, above
      # lines.each do |line|
      #   @user.lines << Line.find(line)
      # end

      redirect_to edit_user_path(@user)
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
    @lines = Line.all
  end

  def update
    @user = User.find(params[:id])

    #updates users train tracking preference
    lines = params[:line_ids]
    @user.line_ids = lines

    if @user.update_attributes(params[:user])
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    user = @authenticated_user
    user.delete

    redirect_to root_path
  end
end