module PredictionsHelper
  def check_current_value prediction
    ExchangePrice.where(currency: prediction.currency, coin: prediction.coin).last.spot
  rescue
    error = { error: "This is not a valid transaction"}
    return errorx
  end
end
