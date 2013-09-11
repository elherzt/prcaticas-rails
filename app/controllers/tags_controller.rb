class TagsController < ApplicationController
  def remove
      #binding.pry
      @car = Car.find(params[:car_id])
      @tag = Tag.find(params[:id])
      @car.tags -= [@tag]
      #binding.pry
      @car.save
      render :nothing => true
  end
end
