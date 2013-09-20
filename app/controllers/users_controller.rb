class UsersController < ApplicationController
  caches_action :show, :cache_path => (proc do
    user_path(params[:id] + "/#{current_user.id}/#{params[:page] || 1}")
  end)
  def index
    @user = User.all
  end

  def new
    @user = User.new
  end
  def show
    @user = User.find(params[:id])
    @cars = @user.cars.page(params[:page]).per(3)
  end

  def edit
    @user = User.find(params[:id]) 
  end

 
end
