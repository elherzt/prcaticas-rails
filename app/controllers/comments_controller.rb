class CommentsController < ApplicationController
  #before_filter :authenticate_user!
  before_action :require_signin!, except: [:show,:index]
  before_filter :find_car
  def create
    @comment = @car.comments.build(comment_params)
    #@comment.user = current_user
    if @comment.save
      flash[:notice] = "Comment has been created."
      redirect_to :back
    else
      flash[:alert] = "Comment has not been created."
      render :template => "cars/show" 
    end
  end
  private
  def comment_params
    params.require(:comment).permit(:text, :state_id)
  end
  def find_car
    @car = Car.find(params[:car_id])
  end
end
