class ProcessPredictionsJob < ApplicationJob
  queue_as :predictions

  # include Sidekiq::Worker
  # sidekiq_options queue: 'predictions'

  def perform(*args)
    Prediction.all.each do |prediction|
      next if prediction.expiring_at > DateTime.now

      user = User.find(prediction.user.id)
      actual_price = ExchangePrice.where(coin: prediction.coin, currency: prediction.currency).last.spot

      predicted = user.predicteds.new({
        coin: prediction.coin,
        exchange: prediction.exchange,
        currency: prediction.currency,
        prediction_type: prediction.prediction_type,
        change_in_price: prediction.change_in_price,
        value_at_time: prediction.current_value,
        value_at_expiration: actual_price,
        expired_at: prediction.expiring_at
      })

      prediction.delete if predicted.save!
    end
  end
end
