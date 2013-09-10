class CarsController < ApplicationController
before_action :set_user
  def new
   @car = @user.cars.build
   3.times { @car.assets.build}
 end

 def create
   @car = @user.cars.new(car_params)
   #binding.pry
   if @car.save
     flash[:notice] = "car added"
     redirect_to @user
   end
 end
 
 def show
   @car = @user.cars.find(params[:id])
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

 private
 def set_user
   @user = User.find(params[:user_id])
 end

 def car_params
   params.require(:car).permit(:model, :brand, :user_id, assets_attributes: [:asset])
 end

end
