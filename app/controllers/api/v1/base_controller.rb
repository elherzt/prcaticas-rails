class Api::V1::BaseController < ActionController::Base
  respond_to :json, :xml
  before_filter :authenticate_user!
end
