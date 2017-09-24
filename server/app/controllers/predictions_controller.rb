class PredictionsController < ApplicationController
  include PredictionsHelper

  before_action :authenticate_user!
  before_action :set_prediction, only: [:show, :destroy]

  def index
    render json: @current_user.predictions, each_serializer: PredictionsSerializer
  end

  def show
    render json: @prediction, serializer: PredictionsSerializer, root: true
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
    deleted_prediction = @prediction.delete
    render json: deleted_prediction, serializer: PredictionsSerializer
  rescue
    render json: {error: 'bla'}
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
