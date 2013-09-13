class Api::V1::UsersController < Api::V1::BaseController
  #def index
    #respond_with(User.all)
  #end
  def index
    binding.pry
    respond_with(Car.all.where('user_id = ?',current_user))
  end
end
