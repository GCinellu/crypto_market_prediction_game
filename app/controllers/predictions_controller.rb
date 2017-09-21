class PredictionsController < ApplicationController
  include PredictionsHelper

  before_action :authenticate_user!
  before_action :set_prediction, only: [:show, :destroy]

  def index
    response = { predictions: @current_user.predictions }

    render json: response
  end

  def show
    response = { prediction: @prediction }

    render json: response
  end

  def create
    prediction = @current_user.predictions.new prediction_params

    current_value = check_current_value(prediction.currency, prediction.coin)

    prediction.current_value = current_value
    prediction.save!

    response = {
      message: "I'll soon be able to tell if you suck or rock",
      prediction: {
        coin: prediction.coin,
        exchange: prediction.exchange,
        currency: prediction.currency,
        prediction_type: prediction.prediction_type,
        change_in_price: prediction.change_in_price,
        current_value: prediction.current_value,
        expiring_at: prediction.expiring_at
      }
    }

    render json: response, response: :success
    # render json: {}
  rescue Exception => error
    render json: { error: error }
  end

  def destroy
    render json: { deleted_prediction: @prediction.delete }
  end

  private

  def set_prediction
    @prediction = @current_user.predictions.find(params[:id])
  end

  def prediction_params
    params.require(:prediction).permit(:coin, :exchange, :currency,
      :prediction_type, :change_in_price, :expiring_at
    )
  end
end
