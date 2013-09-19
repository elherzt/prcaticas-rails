class Api::V2::BaseController < ActionController::Base
  respond_to :json, :xml
  before_filter :authenticate_user!

end
