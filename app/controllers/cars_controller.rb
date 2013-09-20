class CarsController < ApplicationController

  before_filter :authenticate_user!, except: [:show,:index]
  #caches_action :show
  before_action :set_user

  def new
   @car = @user.cars.build
   3.times { @car.assets.build}
 end

 def create
   @car = @user.cars.new(car_params)
   if @car.save
     Notifier.user_created(current_user).deliver
     flash[:notice] = "car added"
     redirect_to @user
   end
 end
 
 def show
   @car = @user.cars.find(params[:id])
   @comment = @car.comments.build
   @states = State.all
 end

def edit
  @car = @user.cars.find(params[:id])
end

 def update
   @car = @user.cars.find(params[:id])
   if @car.update_attributes(car_params)
     redirect_to @car
   end
 end

 def search
   @cars = @user.cars.search("tag:#{params['search']}")
   @cars = @cars.page(params[:page]).per(3)
   render "users/show"
 end


 private
 def set_user
   @user = User.find(params[:user_id])
 end

 def car_params
   params.require(:car).permit(:model, :brand, :user_id, :tag_names, assets_attributes: [:asset])

 end
end
