class PredictedsController < ApplicationController
  before_action :authenticate_user!

  def index
    response = { predicteds: @current_user.predicteds }
    render json: response
  end

  def show
    response = { predicted: @current_user.predicteds.find(params[:id]) }
    render json: response, status: 200
  end
end
