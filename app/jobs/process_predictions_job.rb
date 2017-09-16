class ProcessPredictionsJob < ApplicationJob
  queue_as :predictions

  def perform(*args)
    Prediction.all.each do |prediction|
      next if prediction.expiring > DateTime.now

      user = User.find(prediction.user)

      predicted = user.predicted.new({
        amount: float,
        expiration: datetime,
        coin: string,
        coin_price_at_datetime: float,
        created_at: datetime,
        updated_at: datetime
      })

    end
  end
end
