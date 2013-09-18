class Api::V1::UsersController < Api::V1::BaseController
 
  def index
    respond_with(Car.all.where('user_id = ?',current_user.id))
  end


  def create
    car = Car.new(params[:car])
    if car.save
      respond_with(car, :location => api_v1_car_path(car))
    else
      respond_with(car)
    end
  end

  def show
    @car = Car.find(params[:id])
    respond_with(@car, :methods => "last_car")
  end


end
