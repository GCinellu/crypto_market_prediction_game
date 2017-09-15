class BtcCoinbasePrices < ApplicationJob
  queue_as :coinbase

  def initialize
    @coinbase = Coinbase.new
  end

  def perform(*args)
    prices = @coinbase.prices

    ExchangePrice.create(
      sell: prices[:sell],
      buy: prices[:buy],
      spot: prices[:spot],
      exchange: 'Coinbase',
      coin: 'BTC',
      currency: 'EUR'
    )
  end
end
