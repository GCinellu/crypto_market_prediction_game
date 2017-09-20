class PredictedsController < ApplicationController
  before_action :authenticate_user!

  def index
    response = {
      predicteds: @current_user.predicteds
    }

    render json: response
  end

  def show
  end
end
