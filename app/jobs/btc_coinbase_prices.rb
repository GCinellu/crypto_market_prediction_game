class BtcCoinbasePrices < ApplicationJob
  queue_as :coinbase

  def perform
    @coinbase ||= Coinbase.new

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
