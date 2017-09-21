module PredictionsHelper
  def check_current_value currency, coin
    return "Not a valid currency" unless Currencies.list.include?(currency)
    return "Not a valid coin"     unless Coins.list.include?(coin)

    ExchangePrice.where(currency: currency, coin: coin).last.spot
  end
end
