class UsersController < ApplicationController

  def index
    @user = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      Notifier.user_created(@user).deliver
      flash[:notice] = "User has been created."
      redirect_to @user
    else
      render "new"
    end
  end

  def show
    @user = User.find(params[:id])
    @cars = @user.cars
  end

  def edit
    @user = User.find(params[:id]) 
  end

  def update
    @user = User.find(params[:id]) 
    if @user.update_attributes(user_params)
      redirect_to @user
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :password, :mail, :password_confirmation)
  end
end
