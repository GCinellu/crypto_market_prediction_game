class PredictedsController < ApplicationController
  before_action :authenticate_user!

  def index
    render json: @current_user.predicteds, each_serializer: PredictedsSerializer, root: true
  end

  def show
    render json: @current_user.predicteds.find(params[:id]), serializer: PredictedsSerializer, root: true
  end
end
