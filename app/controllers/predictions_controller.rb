class PredictionsController < ApplicationController
  before_action :authenticate_user!

  def index
    response = {
      predictions: @current_user.predictions
    }

    render json: response
  end

  def create
    prediction = @current_user.predictions.create! prediction_params

    response = {
      message: "I'll soon be able to tell if you suck or rock",
      prediction: {
        coin: prediction.coin,
        exchange: prediction.exchange,
        currency: prediction.currency,
        prediction_type: prediction.prediction_type,
        change_in_price: prediction.change_in_price,
        current_value: prediction.check_current_value.spot,
        expiring_at: prediction.expiring_at
      }
    }

    render json: response, response: :success
    # render json: {}
  rescue Exception => error
    render json: { error: error }
  end

  private

  def prediction_params
    params.require(:prediction).permit(:coin, :exchange, :currency,
      :prediction_type, :change_in_price, :expiring_at
    )
  end
end
